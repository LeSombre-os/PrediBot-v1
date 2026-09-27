# Idées post-expérience — Ne pas lire avant la fin

## OWID API
L'API Our World in Data (https://ourworldindata.org/grapher/{slug}.csv) est gratuite et pourrait alimenter le bot en données fondamentales (climat, santé, énergie, démographie…) pour affiner les estimations de probabilité sur les marchés Polymarket liés à ces sujets.

## Vers un système plus sophistiqué

Le bot PowerShell actuel fait le job, mais pour passer à l'échelle, envisager :

- **Portage en Python / Node.js** — meilleure gestion des APIs, parsing JSON/CSV, écosystème de librairies
- **Base de données légère** (SQLite) pour l'historique des trades, au lieu de fichiers plats
- **Analyse quantitative** avec OWID + autres sources de données pour calculer les probabilités de façon programmatique plutôt que via l'agent IA
- **Dashboard web** pour visualiser le portefeuille et les performances en temps réel
- **WebSockets Polymarket** pour des prix en temps réel au lieu de polling REST
- **Multi-marchés simultanés** avec gestion de corrélation entre positions
- **Backtesting** sur données historiques pour valider les stratégies avant de les déployer
- **Alertes** quand un edge intéressant apparaît sur un marché surveillé
