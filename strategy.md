# Stratégie PrédiBot — Polymarket Paper Trading

## Objectif
Transformer **$1,000 virtuels** en maximum de capital en **7 jours** (14 juin → 21 juin 2026).

## Capital & Limites

| Règle | Valeur |
|-------|--------|
| Capital initial | $1,000.00 |
| Horizon | 14 juin 23:59 → 21 juin 23:59 |
| Max positions simultanées | 5 |
| Max par position | 40% du portefeuille ($400) |
| Taille de base | 25% du portefeuille |

## Entry Rules

| Edge (mon estimation - prix marché) | Taille de position |
|---|---|
| < 10% | PASS — pas de trade |
| 10-20% | 15-25% du portefeuille |
| 20-30% | 30% du portefeuille |
| 30%+ | 40% du portefeuille (cap) |

Calcul du nombre de shares : `montant_engagé / prix_entrée`

## Exit Rules

- **Résolution du marché** → P&L réalisé automatiquement
- **Stop loss**: si le prix actuel est 40% en dessous du prix d'entrée → EXIT
- **Invalidation de thèse**: si nouvelles infos contredisent la prédiction → EXIT immédiat
- **Réallocation**: si meilleure opportunité trouvée et positions pleines → EXIT la moins bonne position
- **Jour 7**: liquidation de toutes les positions au prix du marché

## Market Selection (ordre de priorité)

1. **Matchs du jour** (résolution < 24h) — sports, événements quotidiens
2. **Marchés avec endDate ≤ 21 juin** — résolution garantie dans la semaine
3. **Momentum plays** — marchés avec fort price movement récent (1h, 24h)
4. **High volume** (> $10k/jour) — liquidité suffisante pour exit simulé
5. **Event-driven** — catalyseur identifiable dans la semaine

## Gestion des Risques

- Si 3 pertes consécutives → réduire sizing de 50% jusqu'à une victoire
- Perte max par jour : 20% du portefeuille (si atteint, stop trading pour la journée)
- Diversification : max 2 positions dans la même catégorie (ex: 2 World Cup, pas 5)

## Calcul P&L

### Achat YES
- Résolution YES → Profit = (1.00 - entry_price) × shares
- Résolution NO → Perte = entry_price × shares

### Achat NO
- Résolution NO → Profit = (1.00 - entry_price) × shares
- Résolution YES → Perte = entry_price × shares

### Exit avant résolution
- P&L = (exit_price - entry_price) × shares (si YES)
- P&L = (entry_price - exit_price) × shares (si NO)
