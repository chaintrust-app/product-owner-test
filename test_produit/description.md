# TEST PRODUIT

Chaintrust possède 4 types d'utilisateurs
- Les administrators sont les associés d'un cabinet d'expertise comptable
- Les managers sont les chefs de mission du cabinet
- Les collaborators sont les comptables en cabinet
- Les customers sont les clients du cabinet (gérants de sociétés, par exemple)

Ces différents types d'utilisateurs doivent pouvoir accéder aux sociétés clientes du cabinet.

Il y a 2 types de sociétés
- Les sociétés normales
- Les sociétés cachées

Comment détermine-t-on si un utilisateur a accès à une société ?
- Les administrators peuvent voir toutes les sociétés
- Les managers peuvent voir toutes les sociétés sauf les sociétés cachées, pour lesquelles ils ont besoin d'une permission
- Les collaborators ont besoin d'une permission pour voir une société
- Les customers ont besoin d'une permission pour voir une société

Un utilisateur peut avoir autant de permissions que de sociétés, mais une seule permission par société max.
La relation entre les permissions, les utilisateurs et les sociétés est donc la suivante.
utilisateur -> permission <- société

Qui peut donner une permission ?
- Les administrators peuvent donner des permissions à tous les utilisateurs pour toutes les sociétés
- Les managers peuvent donner des permissions aux collaborators et aux customers pour les sociétés auxquelles ils/elles ont accès
- Les collaborators peuvent donner des permissions aux customers pour les sociétés auxquelles ils/elles ont accès
- Les customers ne peuvent pas en donner

--------

L'équipe produit est en train de préparer un menu déroulant permettant à un utilisateur de donner une permission à un autre utilisateur.
Un exemple du design de ce menu se trouve dans le fichier permission.png.

Au clic sur le menu déroulant, une liste de sociétés s'affiche afin d'offrir une permission à l'utilisateur.
La multi sélection est possible : l'utilisateur qui offre la permission sélectionne une ou plusieurs sociétés, puis clique sur "ajouter"
Pour des raisons de praticité, on souhaite ne pas afficher une société à laquelle l'utilisateur a déjà accès dans ce menu.

Votre mission est d'écrire une User Story avec plusieurs test d'acceptance afin de permettre à l'équipe tech de coder ce menu facilement.
Vos tests d'acceptance doivent couvrir tous les cas possibles.

Voici un exemple de test d'acceptance
GIVEN : Je suis un administrator en train de regarder le menu d'un collaborator. Il existe 2 sociétés, X et Y. Le collaborator n'a aucune permission.
WHEN : Je clique sur le menu de permissions.
THEN : Les deux sociétés X et Y s'affichent dans le menu et je peux les sélectionner.
