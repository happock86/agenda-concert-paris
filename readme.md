# Agenda des concerts — Paris & proche banlieue

Page HTML autonome listant les concerts rock, indé, punk, cold wave, électro et
hip-hop dans les petites salles de Paris et de sa proche banlieue (rayon ~10 km).
Le fichier `index.html` est autonome : aucun asset externe, aucun JavaScript ;
il suffit de le déposer à la racine d'un hébergement.

## Contenu

- Tableau des concerts couvrant une fenêtre glissante du jour même à J+60.
- Colonnes : Date, Groupe / Artiste, Lieu, Style, Prix, Billetterie / Source.
- Chaque nom de groupe renvoie vers une page d'écoute : Bandcamp en priorité,
  sinon page ou recherche Spotify, sinon site officiel.
- La colonne Billetterie renvoie directement à la page d'achat du concert
  (DICE, Shotgun, See Tickets, France Billet, Fnac Spectacles) ou à la
  billetterie de la salle.
- Prix indicatifs hors frais de billetterie ; « Entrée libre » pour les
  concerts gratuits.

## Critères de sélection

- Salles du périmètre uniquement : Le Chinois et La Marbrerie (Montreuil),
  Le Zéralda (Bagnolet), La Pointe Lafayette, La Maroquinerie, Le Badaboum,
  Le Supersonic, Point Éphémère, Le Hasard Ludique, Petit Bain, Le Trianon,
  La Station — Gare des Mines, Le Consulat Voltaire, Le Cabaret Sauvage.
- Genres : rock, rock indé, new wave, cold wave, techno / électro, hip-hop,
  punk, noise, shoegaze.
- Prix 5–30 € ou entrée libre.
- Exclusions : concerts « complet », soirées club sans concert live,
  spectacles hors genres retenus, concerts au-dessus du plafond de prix.

## Mise à jour hebdomadaire

Une tâche planifiée Vibe Code exécute la mise à jour chaque mardi à minuit
(heure de Paris) :

1. Déterminer la plage à couvrir : du jour même à J+60.
2. Consulter les agendas des 14 salles ainsi que lylo.fr, infoconcert,
   bandsintown, parisbouge et concerts.paris.
3. Ajouter les nouveaux concerts avec liens d'écoute, prix et billetterie.
4. Retirer les concerts passés, corriger changements de salle et annulations,
   actualiser les compteurs par mois.
5. Envoyer un brouillon Gmail à david.paour@gmail.com avec le fichier
   `index.html` à jour (envoi du brouillon manuel).

Intégration dans ce dépôt : télécharger la pièce jointe `index.html` du
brouillon hebdomadaire, committer à la racine, déployer sur l'hébergement.

## Hébergement

Dépôt du fichier `index.html` à la racine du site via FTP, sous ce nom exact.
Page statique : aucune configuration serveur requise.