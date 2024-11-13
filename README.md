# Projet de Base de Données - Centre de Formation

## Description

Ce projet consiste en la création d'une base de données pour un centre de formation, permettant de gérer les informations des étudiants, des sessions de formation, des spécialités, et des formations proposées. Le modèle de données a été conçu pour respecter les règles de normalisation et assurer une intégrité des données entre les différentes entités.

## Structure de la Base de Données

La base de données contient les tables suivantes :

1. **Étudiant** : Enregistre les informations personnelles des étudiants inscrits.
    - **Clé primaire** : `NumCINetu`
    - **Attributs** : `NomEtu`, `prenomEtu`, `dateNaissance`, `adresseEtu`, `villeEtu`, `niveauEtu`

2. **Session** : Stocke les informations sur les sessions de formation.
    - **Clé primaire** : `codeSess`
    - **Attributs** : `nomSess`, `dateDebut`, `dateFin`, `codeForm`
    - **Contraintes** :
      - `CHECK` : `dateFin` doit être supérieure à `dateDebut`
      - **Clé étrangère** : `codeForm` (référenciant `Formation(codeForm)`)

3. **Formation** : Contient les informations sur les différentes formations proposées par le centre.
    - **Clé primaire** : `codeForm`
    - **Attributs** : `titreForm`, `dureeForm`, `prixForm`

4. **Spécialité** : Enregistre les différentes spécialités dans lesquelles les étudiants peuvent se spécialiser.
    - **Clé primaire** : `codeSpec`
    - **Attributs** : `nomSpec`, `desSpec`, `active`
    - **Contraintes** :
      - `CHECK` : `active` doit être soit `1` (actif) soit `0` (inactif)

5. **Inscription** : Table intermédiaire pour gérer les inscriptions des étudiants dans les sessions.
    - **Clés primaires** : `NumCINetu`, `codeSess`
    - **Clés étrangères** : `NumCINetu` (référenciant `Étudiant`), `codeSess` (référenciant `Session`)
    - **Attribut** : `TypeCours`

6. **Appartenance** : Gère les relations entre les spécialités et les formations.
    - **Clés primaires** : `codeSpec`, `codeForm`
    - **Clés étrangères** : `codeSpec` (référenciant `Spécialité`), `codeForm` (référenciant `Formation`)

## Schéma de la Base de Données

Le schéma de la base de données est conçu pour respecter les principes de normalisation jusqu'à la 3ème forme normale (3NF). Chaque table est liée par des clés étrangères pour garantir l'intégrité des données et éviter la redondance.

## Installation et Utilisation

### Prérequis

- Un système de gestion de base de données compatible avec SQL (par exemple, MySQL, PostgreSQL).
- Un client SQL ou un terminal pour exécuter les commandes SQL.
