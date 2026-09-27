# PrédiBot v1 — Paper-trading Polymarket (expérience terminée)

> ⚠️ **100 % fictif / paper-trading.** Capital virtuel de $1 000, aucun argent
> réel, aucune clé API, aucun wallet. Expérience à but éducatif : observer ce
> qu'un LLM seul vaut comme trader. **Ceci n'est pas un conseil financier.**

## L'expérience

PrédiBot : un agent LLM qui, chaque jour du 14 au 22 juin 2026, récupère les
marchés Polymarket via API publique, estime les probabilités, entre en position
quand son edge estimé dépasse 10 %, et consigne tout dans des fichiers plats.
Neuf runs quotidiens, sans pipeline quantitative, sans backtest.

Stratégie (`strategy.md`) : max 5 positions, 15-40 % du portefeuille selon
l'edge, stop-loss -40 %, liquidation J7.

## Résultat (assumé, fait partie des données)

```
💰 Capital initial : $1 000.00
💰 Capital final :   $  402.04
📉 ROI :             -59.80%
🎯 Trades :          3 | Wins: 0 | Losses: 3 | Win rate: 0 %
```

| Marché | Side | Entry → Exit | P&L | Raison |
|---|---|---|---|---|
| MegaETH airdrop June 30? | YES | 0.1385 → 0.026 | -$162.46 | Stop-loss, thèse invalidée |
| Czechia gagne (WC) | YES | 0.525 → 0.00 | -$167.48 | Résolution NO (nul 1-1) |
| Cepeda présidentielle Colombie | YES | 0.095 → 0.00 | -$268.00 | Résolution NO (49.66 vs 48.70) |

Leçon principale : **un LLM seul, sans pipeline quantitative ni backtesting,
n'est pas un moteur de trading fiable** — mais il a montré un potentiel en
détection d'anomalies (le mispricing Cepeda était réel, le binaire n'a pas
pardonné). Détail dans `rapport-final.md`.

## Contenu du repo

```
README.md
.gitignore
strategy.md                 # Règles d'entry/exit, sizing, risque
fetch-markets.ps1           # Fetch marchés (Gamma API publique, sans clé)
bot-log.txt                 # Log des 9 runs
portfolio.json              # État final + historique des 3 trades
performance.md              # Métriques finales
rapport-final.md            # Rapport définitif post-résolution (485 lignes)
rapport-final-template.md   # ARCHIVE — snapshot intermédiaire du 20/06
                            # (scénarios hypothétiques pré-résolution)
idees-post-experience.md    # Pistes v2 (Python, SQLite, WS, backtest…)
predictions/2026-06-14.md … 2026-06-22.md  # 1 fichier par run quotidien
```

## Rejouer l'expérience

1. PowerShell 5.1+ avec accès Internet.
2. `.\fetch-markets.ps1` affiche top events, marchés actifs, matchs du jour,
   momentum (aucune clé requise).
3. Analyser à la main ou via un agent, appliquer `strategy.md`, consigner le
   run dans `predictions/AAAA-MM-JJ.md` sur le même format.

## Et la suite ?

La v2 (« Polymax » : Python 3.12, FastAPI, SQLite, Kelly, WebSocket,
dashboard) est en cours de développement et **remplacera ce repo** une fois
aboutie. Cette v1 reste figée comme archive de l'expérience.
