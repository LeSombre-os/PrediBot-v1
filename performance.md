# Performance Tracker — PrédiBot Polymarket

Dernière mise à jour: 22 juin 2026 — Run 9 (RÉSOLU — EXPÉRIENCE TERMINÉE)

## Résumé

| Métrique | Valeur |
|----------|--------|
| Capital initial | $1,000.00 |
| Capital final | **$402.04** |
| Cash disponible | $402.04 |
| Positions (coût) | $0.00 |
| Positions (marché) | $0.00 |
| P&L réalisé total | **-$597.96** |
| ROI final | **-59.80%** |
| Trades fermés | 3 |
| Trades ouverts | 0 |
| Win rate | 0% |
| Profit factor | 0 |
| Meilleur trade | +$0.00 |
| Pire trade | -$268.00 (Cepeda) |
| Plus longue série wins | 0 |
| Plus longue série losses | 3 |
| Exposition moyenne | 21.2% |

## Positions fermées (final)

| Marché | Side | Entry | Exit | Shares | Coût | P&L | Retour | Jours | Raison |
|--------|------|-------|------|--------|------|-----|--------|-------|--------|
| MegaETH airdrop June 30? | YES | 0.1385 | 0.026 | 1,444 | $200.00 | **-$162.46** | -81.23% | 3 | Stop loss — thèse invalidée |
| Czechia gagne vs South Africa (WC) | YES | 0.525 | 0.00 | 319 | $167.48 | **-$167.48** | -100% | 1 | Résolution NO — match nul 1-1 |
| 🇨🇴 Cepeda gagne présidentielle Colombie | YES | 0.095 | 0.00 | 2,821 | $268.00 | **-$268.00** | -100% | 3 | Résolution NO — De la Espriella gagne 49.66% vs 48.70% |

## Courbe de progression finale

```
$1,100 | ●
$1,000 | ●   ●   ●
$950   |
$900   |
$850   |
$800   |                                  ● (Run 7 — m2m)
$750   |                                  ● (Run 8 — m2m)
$700   |               ● (Run 6 — book)
$670   |               ● (Run 6 — book)
$650   |
$600   |
$550   |
$500   |
$450   |
$402   |               ●                   ● (Run 9 — final)
        |---|---|---|---|---|---|---|---|---|
         14   15   16   17   18   19   20   21   22
```

## Résultat final

```
💰 Capital initial:  $1,000.00
💰 Capital final:    $  402.04
📉 ROI:              -59.80%
🎯 Trades:           3 | Wins: 0 | Losses: 3 | Win rate: 0%
```

## Verdict de l'expérience

**L'expérience PrédiBot est terminée.** Le bot a transformé $1,000 en $402.04, soit une perte de -59.80%.

3 trades, 3 pertes, 0% win rate. Aucun trade gagnant en 7 jours.

Pourtant, la détection du mispricing Cepeda était correcte — le gap de 35 points était réel. Mais le trading binaire est impitoyable : avoir raison à 48.7% donne le même résultat qu'avoir raison à 10%. La thèse était partiellement correcte, mais le résultat binaire ne pardonne pas.

La leçon la plus importante : **un LLM seul, sans pipeline quantitative, sans backtesting, sans modèles dédiés, n'est pas un moteur de trading fiable.** Mais comme outil d'analyse qualitative et de détection d'anomalies, il a montré son potentiel.
