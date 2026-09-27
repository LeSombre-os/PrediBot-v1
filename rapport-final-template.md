# Rapport Final — PrédiBot: Experience Polymarket Paper Trading

**Agent:** Polymax v1.0 (DeepSeek V4 Flash / OpenCode)
**Période:** 14 juin → 21 juin 2026 | 7 jours
**Capital initial:** $1,000.00
**Dernière mise à jour:** 20 juin 2026 (Run 7) — Résultat final à confirmer demain 21 juin

---

## Table des Matières

1. Résumé de l'expérience
2. Performance détaillée
3. Journal complet des trades
4. Analyse par catégorie de marché
5. Analyse critique du système — Points négatifs techniques
6. Analyse des causes profondes des pertes
7. Leçons apprises
8. Améliorations recommandées pour PrédiBot v2.0
9. Architecture cible pour la prochaine itération
10. Verdict final (à compléter après la résolution Cepeda)

---

## 1. Résumé de l'expérience

### Chiffres clés (à date, pré-résolution Cepeda)

| Métrique                   | Valeur                 |
| -------------------------- | ---------------------- |
| Capital initial            | $1,000.00              |
| Capital actuel (book cost) | $670.06                |
| Capital mark-to-market     | **$726.46**            |
| ROI (book cost)            | -32.99%                |
| ROI (mark-to-market)       | -27.35%                |
| Période                    | 14 juin → 21 juin 2026 |
| Nombre de runs             | 7                      |
| Trades effectués           | 3 (2 fermés, 1 ouvert) |
| Trades analysés et passés  | 25+                    |
| Exposition moyenne         | 26.7%                  |
| Pertes cumulées            | -$329.94 (réalisé)     |

### Scénarios post-Run 8 (demain)

| Scénario       | Probabilité | Capital final | ROI final   |
| -------------- | ----------- | ------------- | ----------- |
| ✅ Cepeda GAGNE | ~44%        | **$2,955.05** | **+195.5%** |
| ❌ Cepeda PERD  | ~56%        | **$402.04**   | **-59.8%**  |

### Flow de l'expérience

```
Jour 1 (14/06):  Capital $1,000 → Entry MegaETH @ 0.1385 (20% portefeuille)
Jour 2 (15/06):  MegaETH monte à 0.1885 (+36%) — portefeuille à $1,072 (+7.2%)
Jour 3 (16/06):  MegaETH corrige à 0.138 (-26.8%) — portefeuille à $999 (-0.1%)
Jour 4 (17/06):  ❌ MegaETH CRASH → STOP LOSS @ 0.026 (-81%) — portefeuille $837 (-16.3%)
Jour 5 (18/06):  ✅ Entry Czechia YES @ 0.525 (20%) — portefeuille $837
Jour 6 (19/06):  ❌ Czechia PERD → 1-1 draw, résolu NO (-100%) — portefeuille $670 (-33%)
                  ✅ Entry Cepeda YES @ 0.095 (40%) — le trade de la semaine
Jour 7 (20/06):  HOLD Cepeda — prix monte à 0.115 (+21%) — portefeuille $726 m2m
Jour 8 (21/06):  ⏳ Résolution Cepeda — verdict final
```

---

## 2. Performance détaillée

### Métriques de trading

| Métrique                 | Valeur                        |
| ------------------------ | ----------------------------- |
| Win rate                 | **0%** (0 wins, 2 losses)     |
| Profit factor            | 0 (aucun trade gagnant fermé) |
| Plus longue série wins   | 0                             |
| Plus longue série losses | 2 (en cours)                  |
| Meilleur trade           | +$0.00                        |
| Pire trade               | -$167.48 (Czechia World Cup)  |
| Perte moyenne            | -$164.97                      |
| Écart-type des returns   | 3.5% (intra-run)              |
| Exposition moyenne       | 26.7% du portefeuille         |
| Taille moyenne position  | $211.82                       |
| Jours de hold moyen      | 2 jours                       |

### Métriques d'estimation

| Métrique                  | Valeur                                             |
| ------------------------- | -------------------------------------------------- |
| Estimations réalisées     | 25+ marchés                                        |
| Trades avec edge > 10%    | 3 (MegaETH +11.15%, Czechia +11.5%, Cepeda +34.5%) |
| Trades exécutés           | 3/3                                                |
| PASS avec edge 8-10%      | 1 (Paix US-Iran NO @ 9.65%)                        |
| Précision des estimations | N/A (pas assez de trades fermés pour calibrer)     |
| Biais moyen d'estimation  | À déterminer après résolution Cepeda               |

### Métriques de risque

| Métrique                | Valeur                          |
| ----------------------- | ------------------------------- |
| Drawdown maximum        | -32.99% (book cost)             |
| Perte max par jour      | -$167.48 (19 juin, Czechia)     |
| Days en drawdown        | 4/7 (jours 4-7)                 |
| Ratio trades/exposition | 12% (3 trades sur 25+ analyses) |

---

## 3. Journal complet des trades

| #   | Date entrée | Date sortie | Marché                           | Side | Entry  | Exit  | Shares | Coût    | P&L          | ROI     | Jours | Raison sortie                                                                                                                            |
| --- | ----------- | ----------- | -------------------------------- | ---- | ------ | ----- | ------ | ------- | ------------ | ------- | ----- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | 14/06       | 17/06       | MegaETH airdrop by June 30?      | YES  | 0.1385 | 0.026 | 1,444  | $200.00 | **-$162.46** | -81.23% | 3     | STOP LOSS — Team confirmé Terminal rewards en USDm, pas d'airdrop token. Thèse invalidée.                                                |
| 2   | 18/06       | 19/06       | Czechia win vs South Africa (WC) | YES  | 0.525  | 0.00  | 319    | $167.48 | **-$167.48** | -100%   | 1     | RÉSOLUTION NO — Match nul 1-1. Czechia menait 1-0 (Sadilek 6'), égalisation Mokoena penalty 83'. Sous-estimation de la résilience de SA. |
| 3   | 19/06       | 21/06*      | Cepeda gagne présidentielle 🇨🇴 | YES  | 0.095  | TBD   | 2,821  | $268.00 | **TBD**      | TBD     | 2+    | Résolution demain 21 juin 14:00 UTC. Prix actuel: 0.115 (+21% unrealized).                                                               |

### Trades analysés mais PASSés (edge > 5% uniquement)

| Date  | Marché                     | Prix   | Edge estimé | Raison du PASS                                  |
| ----- | -------------------------- | ------ | ----------- | ----------------------------------------------- |
| 14/06 | Paix US-Iran NO @ 0.8835   | 0.8835 | +9.65%      | Juste sous le seuil de 10%                      |
| 14/06 | Vegas NHL YES @ 0.2095     | 0.2095 | +7.05%      | Sous le seuil de 10% (bon PASS — Vegas a perdu) |
| 15/06 | Germany WC winner @ 0.0615 | 0.0615 | +5.85%      | Résolution hors fenêtre                         |
| 17/06 | Colombie Abelardo @ 0.865  | 0.865  | +8-10%      | Juste sous le seuil de 10%                      |
| 20/06 | Germany vs CIV @ 0.645     | 0.645  | 3.5-7.5%    | Sous le seuil                                   |

---

## 4. Analyse par catégorie de marché

### Catégories de trades exécutés

| Catégorie          | Trades | Wins  | Losses     | P&L total    | ROI catégorie |
| ------------------ | ------ | ----- | ---------- | ------------ | ------------- |
| Crypto             | 1      | 0     | 1          | -$162.46     | -81.23%       |
| Sports (World Cup) | 1      | 0     | 1          | -$167.48     | -100%         |
| Politics           | 1      | 0     | 0 (ouvert) | TBD          | TBD           |
| **Total**          | **3**  | **0** | **2**      | **-$329.94** | **-32.99%**   |

### Catégories analysées mais non tradées

| Catégorie                            | Marchés analysés | Raison principale du PASS                     |
| ------------------------------------ | ---------------- | --------------------------------------------- |
| World Cup matchs                     | ~15              | Marchés trop efficients, edges < 10%          |
| Primaires US (VA, OK)                | ~8               | Marchés ultra-priced (Luria @ 0.975+)         |
| Banques centrales (Fed, BoE, Russia) | ~6               | Consensus quasi-unanime, edges ~0%            |
| WC winners long terme                | ~10              | Résolution hors fenêtre (20 juillet)          |
| GTA VI memes                         | ~5               | Trop équilibrés (~0.50), edges nuls           |
| MLB World Series                     | ~10              | Résolution trop lointaine                     |
| Weinstein sentence                   | ~6               | Résolution passée ou hors fenêtre             |
| Autres (NHL, élections locales)      | ~5               | Edges trop faibles ou résolution hors fenêtre |

### Constats par catégorie

**Crypto (1 trade, -81.23%):** Catégorie la plus risquée. Les marchés d'airdrop sont extrêmement sensibles à la sémantique des termes exacts utilisés par les équipes. Un tweet peut détruire 81% de valeur en 24h. Les règles des marchés sont complexes (NFT airdrop vs token airdrop). À éviter ou à réduire drastiquement.

**Sports (1 trade, -100%):** Les matchs de foot à résolution rapide semblent offrir des edges mais la variance est élevée. Même avec une thèse solide (2 suspensions clés en face), le football reste un sport à faible scoring où un penalty peut tout changer. Les marchés sont plus efficients que prévu.

**Politics (1 trade ouvert):** La catégorie la plus prometteuse. Les marchés Polymarket montrent un biais structurel important sur les élections non-US/non-occidentales. La Colombie était massivement mal priced (gap de 35 points entre sondages et marché). C'est dans cette catégorie que se trouvent les plus gros edges.

---

## 5. Analyse critique du système — Points négatifs techniques

### 5.1 Architecture du bot : Fragilité fondamentale

#### Problème : Agent IA comme unique moteur de décision

**Gravité : CRITIQUE**

Le bot entier repose sur un seul agent LLM (DeepSeek V4 Flash) pour :

- Parse les données brutes de l'API Polymarket
- Estimer les probabilités
- Calculer les edges
- Dimensionner les positions
- Logger les décisions
- Mettre à jour tous les fichiers

**Conséquences :**

- **Goulot d'étranglement cognitif** : l'agent doit jongler entre analyse, décision, et écriture de fichiers
- **Pas de reproductibilité** : deux runs avec les mêmes données pourraient produire des décisions différentes
- **Pas de calibration** : impossible de mesurer la précision des estimations de l'IA
- **Coût token élevé** : chaque run consomme énormément de tokens à re-analyser tout depuis zéro
- **Pas de vérification** : aucune validation automatisée des décisions

#### Problème : Stockage sur fichiers plats

**Gravité : ÉLEVÉ**

portfolio.json, bot-log.txt, predictions/*.md, performance.md — 4 formats de fichiers différents

- Lecture/écriture manuelles par l'agent
- Pas d'intégrité référentielle (un fichier peut être mis à jour, les autres non)
- Pas de requêtage possible
- Pas d'historique des prix
- Les fichiers `.md` sont destinés aux humains, pas aux machines

#### Problème : Pas de pipeline données

**Gravité : ÉLEVÉ**

- Le script PowerShell fetch les données une fois par run
- Les données sont affichées en texte brut dans la console
- L'agent doit parser visuellement le texte pour extraire les prix
- Pas de données historiques conservées
- Pas de tracking des variations de prix entre runs
- Impossible de calculer des métriques comme la volatilité, le momentum 7j, etc.

#### Problème : Aucune automatisation des estimations

**Gravité : ÉLEVÉ**

- Les probabilités sont estimées par l'IA via des recherches web
- Pas d'intégration API pour les données de sondages (élections)
- Pas d'intégration API pour les modèles sportifs (football, basket, etc.)
- Pas de scraping des sportsbooks pour comparer les cotes
- Les estimations sont qualitatives, pas quantitatives

### 5.2 Processus de trading : Inefficiences majeures

#### Problème : Estimation manuelle des probabilités

**Gravité : ÉLEVÉ**

Chaque estimation nécessite :

1. Lire les données Polymarket
2. Faire une recherche web pour du contexte
3. Synthétiser l'information
4. Produire un nombre (ex: 44%)

**Problèmes :**

- Pas de méthode standardisée
- Pas de track record de l'estimateur
- Biais de confirmation (l'agent trouve des infos qui supportent sa thèse)
- Pas de calibration : 44% devrait gagner ~44% du temps sur un grand échantillon
- Temps et tokens gaspillés sur chaque estimation

#### Problème : Absence de backtesting

**Gravité : MOYEN**

- Impossible de tester la stratégie sur des données historiques
- Les règles de sizing (10% edge → 15-25%, etc.) n'ont jamais été validées
- Le seuil de 10% est arbitraire
- Pas de simulation Monte Carlo

#### Problème : Pas de gestion du risque en temps réel

**Gravité : MOYEN**

- Les positions ne sont vérifiées qu'une fois par jour (au run)
- Un crash peut se produire 23h avant le prochain run
- Le stop loss est conceptuel, pas exécuté automatiquement
- Pas d'alerte en cas de mouvement anormal

### 5.3 Données et APIs : Limitations techniques

#### Problème : API Polymarket limitée

**Gravité : MOYEN**

- Gamma API ne fournit pas d'order book data
- Pas de bid/ask spread
- Les prix `outcomePrices` sont des mid-prices, pas forcément exécutables
- Volume 24h peut être trompeur sur les marchés à faible liquidité
- Pas de WebSocket pour les prix en temps réel

#### Problème : Sources de données externes ad hoc

**Gravité : MOYEN**

- Les recherches web sont faites via l'outil `websearch` de l'agent
- Pas de sources fiables pré-configurées
- Qualité des résultats variable
- Impossible de comparer systématiquement les cotes sportbooks

### 5.4 Processus opérationnels

#### Problème : Run manuel unique par jour

**Gravité : MOYEN**

- Un seul point de décision par jour
- Les matchs qui se jouent après le run ne sont pas couverts
- Impossible de réagir aux news de dernière minute
- Le timing des runs est critique (avant les matchs)

#### Problème : Pas de diversification systématique

**Gravité : FAIBLE**

- La règle "max 2 par catégorie" est manuelle
- Pas de calcul de corrélation entre positions
- Exposition non optimisée
- Concentration excessive (ex: 40% sur Cepeda)

---

## 6. Analyse des causes profondes des pertes

### Analyse détaillée des 2 trades perdants

#### Trade 1: MegaETH Airdrop (-$162.46, -81.23%)

**Cause racine : Mauvaise interprétation des règles du marché**

Arbre des causes :

```
┌─────────────────────────────────────────────────────┐
│ Erreur fondamentale: mauvaise compréhension du marché│
├─────────────────────────────────────────────────────┤
│  1. L'airdrop Genesis (avril 2026) était un NFT     │
│     drop, pas un token airdrop → exclu par les règles│
│  2. Terminal rewards = USDm, pas de token MEGA      │
│  3. Le marché exigeait un TOKEN airdrop              │
├─────────────────────────────────────────────────────┤
│ Facteurs aggravants :                                │
│  - Volume très faible ($359/jour) = manipulation     │
│    possible                                         │
│  - Momentum haussier initial (+0.021) attirant mais  │
│    artificiel                                       │
│  - Crypto = catégorie ultra-risquée                  │
│  - Pas de vérification des règles avant entrée       │
└─────────────────────────────────────────────────────┘
```

**Leçon technique :** Le bot n'avait aucun mécanisme pour vérifier les règles exactes d'un marché. Les slugs et descriptions des marchés n'étaient pas parsés systématiquement.

#### Trade 2: Czechia vs South Africa (-$167.48, -100%)

**Cause racine : Sous-estimation de la variance dans le football**

Arbre des causes :

```
┌─────────────────────────────────────────────────────────┐
│ Erreur d'exécution: sur-confiance dans une thèse        │
│ qualitative                                            │
├─────────────────────────────────────────────────────────┤
│  1. Thèse correcte: 2 suspensions clés (Sithole, Zwane)│
│  2. Facteurs positifs: Czechia must-win, meilleur       │
│     classement, SA faible hors Afrique                  │
│  3. MAIS: football = faible scoring → 1 penalty         │
│     peut tout changer                                   │
│  4. Résultat: 1-1. Mokoena penalty 83'.                 │
│  5. Modèle Wincomparator donnait Czechia à 49% —        │
│     plus réaliste que mon 64%                           │
├─────────────────────────────────────────────────────────┤
│ Facteurs aggravants :                                   │
│  - Estimation trop optimiste vs consensus des modèles   │
│  - Pas de pondération des modèles de prédiction         │
│  - Biais de confirmation dans la recherche web          │
└─────────────────────────────────────────────────────────┘
```

**Leçon technique :** Le bot s'appuyait sur des recherches web qualitatives plutôt que sur des modèles quantitatifs intégrés. Un modèle sportif API aurait donné une estimation plus réaliste (~49-51%).

### Patterns identifiés

| Pattern                               | Occurrences       | Impact               |
| ------------------------------------- | ----------------- | -------------------- |
| Sous-estimation de la variance        | MegaETH, Czechia  | -$329.94             |
| Sur-confiance dans thèse qualitative  | Czechia           | -$167.48             |
| Mauvaise interprétation des règles    | MegaETH           | -$162.46             |
| Estimation non calibrée               | Tous les trades   | Impossible à mesurer |
| Biais de confirmation (recherche web) | Probablement tous | Systémique           |

---

## 7. Leçons apprises

### 7.1 Trading

1. **La qualité de l'estimation est tout.** Un edge de 11% basé sur une thèse erronée ne vaut rien. Mieux vaut passer 10 trades à 8% avec une thèse solide qu'1 trade à 11% avec une thèse fragile.

2. **Les marchés politiques non-US sont les plus inefficaces.** Le gap de 35 points sur la Colombie était une anomalie massive. Polymarket a un fort biais right-wing/crypto qui déforme les prix des élections de gauche dans les pays émergents.

3. **Le football à faible scoring a une variance énorme.** Un penalty à la 83e minute peut détruire une thèse parfaitement construite. Tenir compte de la distribution des scores (Poisson) plutôt que de faire des estimations binaires.

4. **Le sizing progressif est sous-optimal.** La règle "10% edge = 15-25%" est trop rigide. Un edge de 34.5% (Cepeda) mérite une approche différente d'un edge de 11% (MegaETH). Le Kelly Criterion fractionnaire serait plus approprié.

5. **3 trades en 7 jours, c'est trop peu.** Avec 25+ analyses et seulement 3 trades, le filtre est trop strict. Un seuil à 8% avec des stops plus serrés permettrait plus d'opportunités.

### 7.2 Technique

6. **Un LLM seul n'est pas un moteur de trading fiable.** Il est excellent pour l'analyse qualitative mais ne peut pas remplacer une pipeline de données quantitative. L'hybride IA-données est la solution.

7. **Les fichiers plats ne peuvent pas passer à l'échelle.** Dès le Run 3, la gestion des fichiers devient un goulot d'étranglement. SQLite ou une base simple est indispensable.

8. **Le polling quotidien rate des opportunités.** Les marchés bougent en continu. WebSockets ou polling plus fréquent (toutes les heures) pour les alertes.

9. **L'intégration de données externes est cruciale.** OWID, sports APIs, poll aggregators — le bot doit avoir un pipeline de données automatique.

10. **La reproductibilité est une fonctionnalité, pas un luxe.** Le même run avec les mêmes données devrait produire la même décision.

---

## 8. Améliorations recommandées pour Polymax v2.0

### 8.1 Architecture (priorité: CRITIQUE)

| Amélioration                         | Description                                                                           | Priorité |
| ------------------------------------ | ------------------------------------------------------------------------------------- | -------- |
| **Portage Python**                   | Remplacer PowerShell + agent IA manuel par un bot Python structuré                    | P0       |
| **Base de données SQLite**           | Stocker trades, prix historiques, métriques dans une DB plutôt que des fichiers plats | P0       |
| **Pipeline données automatisé**      | Fetch automatisé des prix, sondages, cotes sportives tous les X minutes               | P0       |
| **Module d'estimation probabiliste** | Algorithme dédié (séparé de l'IA) pour les calculs de probabilité                     | P0       |

### 8.2 Données (priorité: HAUTE)

| Amélioration               | Source                                 | Priorité |
| -------------------------- | -------------------------------------- | -------- |
| **Polling aggregator API** | FiveThirtyEight, Atlas Intel, etc.     | P1       |
| **Sports prediction API**  | Opta, Stats Perform, Football-data.org | P1       |
| **OWID API intégration**   | ourworldindata.org/grapher/{slug}.csv  | P2       |
| **Scraping sportsbooks**   | Bet365, Pinnacle cotes (dé-vigged)     | P1       |
| **WebSocket Polymarket**   | Prix en temps réel via ws://           | P1       |
| **Historical market data** | Polymarket historical endpoints        | P1       |

### 8.3 Prise de décision (priorité: HAUTE)

| Amélioration                      | Description                                                     | Priorité |
| --------------------------------- | --------------------------------------------------------------- | -------- |
| **Kelly Criterion fractionnaire** | f* = (bp - q) / b avec facteur de prudence (0.25-0.5)           | P1       |
| **Calibration des estimations**   | Track Brier score de chaque estimation pour améliorer           | P1       |
| **Corrélation entre positions**   | Éviter la sur-exposition à une même catégorie                   | P1       |
| **Backtesting framework**         | Tester les stratégies sur données historiques avant déploiement | P1       |

### 8.4 Monitoring et exécution (priorité: MOYENNE)

| Amélioration              | Description                                                | Priorité |
| ------------------------- | ---------------------------------------------------------- | -------- |
| **Alertes prix**          | Notification si marché suivi bouge de X% en Y minutes      | P2       |
| **Stop-loss automatique** | Script autonome qui surveille et exit si stop loss trigger | P2       |
| **Dashboard web**         | UI pour visualiser portefeuille, performances, positions   | P2       |
| **Multi-run quotidien**   | 3-4 runs par jour au lieu d'un seul                        | P2       |

### 8.5 Stratégie (priorité: HAUTE)

| Amélioration                         | Description                                                              | Priorité |
| ------------------------------------ | ------------------------------------------------------------------------ | -------- |
| **Seuil d'edge dynamique**           | Ajuster le seuil selon le nombre de jours restants                       | P1       |
| **Spécialisation politique**         | Focus sur les élections non-US où les inefficacités sont les plus fortes | P1       |
| **Modèle Poisson pour le sport**     | Distribution de scores plutôt que win/lose binaire                       | P1       |
| **Intégration des cotes sportbooks** | Comparer Polymarket vs sportsbooks pour trouver les anomalies            | P1       |

---

## 9. Architecture cible: PrédiBot v2.0

```
┌──────────────────────────────────────────────────────────────┐
│                     PrédiBot v2.0 Architecture                │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌─────────────────┐    ┌──────────────────┐                  │
│  │ Data Pipeline    │    │  Decision Engine  │                │
│  │ (Python cron)   │    │  (Python + LLM)   │                │
│  ├─────────────────┤    ├──────────────────┤                  │
│  │ • Polymarket    │───▶│ • Edge calc      │                  │
│  │   REST/WS       │    │ • Kelly sizing   │                  │
│  │ • Sportsbook    │    │ • Risk check     │                  │
│  │   scraping      │    │ • Corrélation    │                  │
│  │ • Polling APIs  │    │ • Calibration    │                  │
│  │ • OWID data     │    │ • LLM analysis   │                  │
│  │ • Sports models │    │   (assist only)  │                  │
│  └────────┬────────┘    └────────┬─────────┘                  │
│           │                      │                            │
│           ▼                      ▼                            │
│  ┌──────────────────────────────────────────────┐              │
│  │              SQLite Database                  │              │
│  │  trades | prices | estimates | performance    │              │
│  └──────────────────────────────────────────────┘              │
│           │                      │                            │
│           ▼                      ▼                            │
│  ┌─────────────────┐    ┌──────────────────┐                  │
│  │ Execution Layer  │    │  Monitoring       │                 │
│  ├─────────────────┤    ├──────────────────┤                  │
│  │ • Auto stop-loss│    │ • Dashboard web   │                 │
│  │ • Order sim     │    │ • Alert system    │                 │
│  │ • Portfolio     │    │ • Performance     │                 │
│  │   rebalance     │    │   tracking        │                 │
│  └─────────────────┘    └──────────────────┘                  │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

### Stack technique recommandé

| Composant     | Technologie                                                              | Raison                            |
| ------------- | ------------------------------------------------------------------------ | --------------------------------- |
| Langage       | **Python 3.12+**                                                         | Écosystème data, APIs, async      |
| Database      | **SQLite + SQLAlchemy**                                                  | Léger, portable, pas de serveur   |
| Data pipeline | **Apache Airflow** ou **Prefect** (léger: **APScheduler** + **asyncio**) | Ordonnancement, retry, monitoring |
| APIs          | **httpx** (async), **websockets**                                        | Performant, moderne               |
| LLM           | **Ollama** (local) ou API OpenAI/DeepSeek                                | Analyse qualitative uniquement    |
| Dashboard     | **FastAPI + HTMX** ou **Gradio**                                         | Rapide, léger, interactif         |
| Backtesting   | **Backtrader** ou **Zipline** (adapté)                                   | Framework existant                |
| Alertes       | **Telegram Bot API** ou **Discord webhook**                              | Gratuit, push notifications       |
| Hosting       | **VPS $5-10/mois** (Hetzner, Linode)                                     | Budget minimal                    |

---

## 10. Décisions de conception pour la v2.0

### Principe fondamental : L'IA comme assistant, pas comme moteur

Dans la v1.0, l'IA (DeepSeek V4 Flash) était le moteur unique de décision. Dans la v2.0, l'IA doit être limitée à :

- Analyse qualitative des news et événements
- Interprétation de données ambiguës
- Génération de rapports humainement lisibles
- Explication des décisions

**Les décisions quantitatives (probabilités, sizing, stops) doivent être automatisées par du code déterministe.**

### Règle des 3 couches

```
Couche 1: Données (déterministe)
  - Fetch APIs
  - Calcul edges
  - Tracking prix
  → Aucune IA impliquée

Couche 2: Décision (semi-automatisée)
  - Sizing via Kelly
  - Stop loss calculation
  - Risk checks
  → Règles codées, paramètres ajustables par l'IA

Couche 3: Analyse (IA-assisted)
  - Interprétation des news
  - Recherche de contexte
  - Rapport journalier
  → L'IA suggère, le code décide
```

### Gestion des données

- Toutes les 15 minutes: fetch Polymarket prices for watched markets
- Toutes les heures: fetch sportsbook odds, poll updates
- Toutes les 6 heures: full scan des nouveaux marchés
- En continu: WebSocket pour les prix des positions ouvertes

### Calibration des estimations

- Chaque estimation est enregistrée avec un timestamp
- Chaque résolution est trackée
- Brier score calculé automatiquement
- Si le Brier score dépasse 0.25 → alerte → révision de la méthode d'estimation

### Kelly Criterion pour le sizing

```
f* = (edge × win_prob - loss_prob × (1 - edge)) / edge
   où:
   - edge = mon_estimation - prix_marche
   - win_prob = mon_estimation
   - loss_prob = 1 - win_prob
   - Kelly fractionnaire = f* × 0.25 (prudent)
```

Contrainte: jamais plus de 35% du portefeuille sur une seule position (au lieu de 40% en v1.0)

---

## 10. Verdict final

> ⚠️ Section à compléter après le Run 8 (21 juin 2026 16:00 UTC)

### À remplir après résolution Cepeda

- [ ] Résultat de l'élection colombienne (21 juin 14:00 UTC)
- [ ] P&L final de la position Cepeda
- [ ] Capital final total
- [ ] ROI final
- [ ] Nombre de trades gagnants (enfin!)
- [ ] Verdict: le bot a-t-il battu le marché?

### Questions à trancher

1. La thèse Cepeda était-elle correcte ?
2. Le gap de 35 points était-il une anomalie réelle ou un "smart money" indicating quelque chose que les sondages ne captaient pas ?
3. Le sizing à 40% était-il justifié ?
4. Le seuil d'edge à 10% était-il trop restrictif ?
5. Quelle est la leçon la plus importante de cette expérience ?

---

*Document généré par Polymax v1.0 — 20 juin 2026*
*Dernière mise à jour: 2026-06-20T08:35:00Z*
*Run 7/7 — En attente du Run 8 final*
