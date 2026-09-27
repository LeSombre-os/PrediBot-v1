<#
.SYNOPSIS
    PrédiBot — Fetch les données Polymarket pour l'agent de trading
.DESCRIPTION
    Récupère : top events, marchés actifs, positions résolues, matchs sportifs
    Nécessite PowerShell 5.1+ et un accès Internet
.NOTES
    Aucune clé API requise — endpoints publics Gamma API
#>

$API_BASE = "https://gamma-api.polymarket.com"
$TIMEOUT = 15
$DATE = (Get-Date).ToString("yyyy-MM-dd")
$DATE_ISO = (Get-Date).ToUniversalTime().ToString("o")

function Get-API {
    param($Url)
    try {
        return Invoke-RestMethod -Uri $Url -Method Get -TimeoutSec $TIMEOUT
    } catch {
        Write-Warning "Erreur API: $($_.Exception.Message)"
        return $null
    }
}

function Format-Price {
    param($PriceStr)
    if (-not $PriceStr) { return @{yes=0; no=0} }
    $p = $PriceStr -replace '"', '' -replace '\[', '' -replace '\]', ''
    $parts = $p -split ', '
    return @{
        yes = [math]::Round([double]$parts[0], 4)
        no  = [math]::Round([double]$parts[1], 4)
    }
}

# ========== 1. TOP EVENTS ==========
$topEvents = Get-API "$API_BASE/events?active=true&closed=false&limit=25&order=volume_24hr&ascending=false"
Write-Output "=== TOP 25 EVENTS (volume 24h) ==="
if ($topEvents) {
    $i = 1
    foreach ($e in $topEvents) {
        $m = $e.markets[0]
        if ($m -and $m.outcomePrices -notmatch '^\["0",\s*"1"') {
            $p = Format-Price $m.outcomePrices
            Write-Output "$i. $($e.title)"
            Write-Output "   Question: $($m.question)"
            Write-Output "   YES: $($p.yes) | NO: $($p.no) | Vol24h: $($e.volume24hr)"
            Write-Output "   End: $($m.endDate) | 1D: $($m.oneDayPriceChange) | 1H: $($m.oneHourPriceChange)"
            Write-Output "   Slug: $($m.slug)"
            Write-Output ""
            $i++
            if ($i -gt 15) { break }
        }
    }
}

# ========== 2. ALL ACTIVE MARKETS WITH REAL PRICES ==========
Write-Output "=== ALL ACTIVE MARKETS (prix réels, vol>0) ==="
$markets = Get-API "$API_BASE/markets?active=true&closed=false&limit=50&order=volume_24hr&ascending=false"
if ($markets) {
    $count = 0
    foreach ($m in $markets) {
        if ($m.outcomePrices -and $m.outcomePrices -notmatch '^\["0",\s*"1"' -and $m.volume24hr -gt 0) {
            $p = Format-Price $m.outcomePrices
            $vol = [math]::Round($m.volume24hr, 0)
            Write-Output "$($m.question)"
            Write-Output "  YES: $($p.yes) | NO: $($p.no) | Vol24h: `$$vol | End: $($m.endDate)"
            Write-Output "  Slug: $($m.slug)"
            $count++
            if ($count -ge 30) { break }
        }
    }
    Write-Output "Total marchés actifs avec prix réels: $count"
}

# ========== 3. MARKETS CLOSING SOON (endDate this week) ==========
$endOfWeek = (Get-Date).AddDays(7).ToString("yyyy-MM-ddTHH:mm:ssZ")
Write-Output "=== MARCHÉS SE TERMINANT CETTE SEMAINE ==="
$closingSoon = Get-API "$API_BASE/markets?active=true&closed=false&limit=20&order=volume_24hr&ascending=false&end_date_max=$endOfWeek&end_date_min=$(Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ')"
if ($closingSoon) {
    foreach ($m in $closingSoon) {
        if ($m.outcomePrices -and $m.outcomePrices -notmatch '^\["0",\s*"1"') {
            $p = Format-Price $m.outcomePrices
            $vol = [math]::Round($m.volume24hr, 0)
            Write-Output "$($m.question)"
            Write-Output "  YES: $($p.yes) | NO: $($p.no) | Vol24h: `$$vol | End: $($m.endDate)"
        }
    }
} else {
    Write-Output "Aucun marché trouvé (ou tous résolus)"
}

# ========== 4. SPORTS — WORLD CUP ==========
Write-Output "=== COUPE DU MONDE 2026 ==="
$wc = Get-API "$API_BASE/markets?active=true&closed=false&limit=20&order=volume_24hr&ascending=false&tag_id=100381"
if ($wc) {
    foreach ($m in $wc) {
        if ($m.outcomePrices -and $m.outcomePrices -notmatch '^\["0",\s*"1"') {
            $p = Format-Price $m.outcomePrices
            $vol = [math]::Round($m.volume24hr, 0)
            Write-Output "$($m.question)"
            Write-Output "  YES: $($p.yes) | NO: $($p.no) | Vol24h: `$$vol"
        }
    }
} else {
    Write-Output "Tag 100381 non disponible"
}

# ========== 5. DAILY MATCHES (résolution < 24h) ==========
Write-Output "=== MATCHES DU JOUR (recherche endDate = today) ==="
$todayStr = (Get-Date).ToString("yyyy-MM-dd")
$tomorrowStr = (Get-Date).AddDays(1).ToString("yyyy-MM-dd")
$daily = Get-API "$API_BASE/markets?active=true&closed=false&limit=30&order=volume_24hr&ascending=false&end_date_min=$todayStr&end_date_max=$tomorrowStr"
if ($daily) {
    foreach ($m in $daily) {
        if ($m.outcomePrices -and $m.outcomePrices -notmatch '^\["0",\s*"1"' -and $m.volume24hr -gt 0) {
            $p = Format-Price $m.outcomePrices
            $vol = [math]::Round($m.volume24hr, 0)
            Write-Output "$($m.question)"
            Write-Output "  YES: $($p.yes) | NO: $($p.no) | Vol24h: `$$vol | End: $($m.endDate)"
        }
    }
} else {
    Write-Output "Aucun match trouvé pour aujourd'hui"
}

# ========== 6. TOP GAINERS / LOSERS 24H ==========
Write-Output "=== TOP MOMENTUM (prix extrêmes, vol>100) ==="
$allMomentum = Get-API "$API_BASE/markets?active=true&closed=false&limit=50&order=volume_24hr&ascending=false"
if ($allMomentum) {
    $gainers = @()
    $losers = @()
    foreach ($m in $allMomentum) {
        if ($m.oneDayPriceChange -and $m.volume24hr -gt 100) {
            $change = [double]$m.oneDayPriceChange
            if ($change -gt 0) { $gainers += $m }
            elseif ($change -lt 0) { $losers += $m }
        }
    }
    $gainers = $gainers | Sort-Object { [double]$_.oneDayPriceChange } -Descending | Select-Object -First 5
    $losers = $losers | Sort-Object { [double]$_.oneDayPriceChange } | Select-Object -First 5

    Write-Output "--- Top 5 gainers 24h ---"
    foreach ($m in $gainers) {
        $p = Format-Price $m.outcomePrices
        $vol = [math]::Round($m.volume24hr, 0)
        Write-Output "$($m.question) | +$($m.oneDayPriceChange) | `$$vol"
    }
    Write-Output "--- Top 5 losers 24h ---"
    foreach ($m in $losers) {
        $p = Format-Price $m.outcomePrices
        $vol = [math]::Round($m.volume24hr, 0)
        Write-Output "$($m.question) | $($m.oneDayPriceChange) | `$$vol"
    }
}

Write-Output ""
Write-Output "=== FETCH COMPLETED: $DATE_ISO ==="
