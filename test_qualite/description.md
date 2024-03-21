# Test qualité Chaintrust

Chaintrust permet à ses clients de saisir des factures en comptabilité depuis un Masque de Saisie (MDS). Votre mission est de tester les fonctionnalités de ce Masque et d'identifier les éventuels problèmes.

Plusieurs tests qualités ont été préparés : tous ces tests doivent passer pour valider la fonctionnalité et l'envoyer en production. De plus, vous pouvez également tester d'autres étapes pour essayer d'identifier des éventuels problèmes. Tout doit marcher parfaitement pour que les clients soient heureux et qu'on aie 5/5 sur Trustpilot :)

Pour effectuer les tests, rendez-vous sur staging.chaintrust.io : Contactez nous pour obtenir les identifiants de test. Une fois les tests effectués, rédigez un rapport concis qui se termine par "La fonctionnalité est validée" si tous les tests passent, ou "La fonctionnalité n'est pas validée" si vous avez identifié des problèmes.

---

**TEST 1/ En tant que client, je peux accéder au MDS**

Je me connecte sur l'interface Chaintrust avec mes identifiants.
Je me déplace dans le menu "Plan Comptable"
Je sélectionne un fournisseur et j'ouvre le menu avec la flèche vers le bas située sur la droite

*-> Les factures de ce fournisseur doivent apparaître*

Je pointe ma souris sur l'une des lignes de factures, puis sur "...", puis sur "Masque de Saisie"

*-> Le MDS doit s'ouvrir et je dois pouvoir modifier les écritures comptables de la facture*

**TEST 2/ En tant que client, je peux effectuer une modification de montant HT sur le MDS**

Je suis sur le MDS
Je pointe ma souris sur le montant de la ligne HT d'une facture
Je double clique puis je change le montant
Je clique sur sauvegarder

*-> La sauvegarde est effectuée*

Je recharge mon navigateur, puis je retourne sur la même facture

*-> Le montant est modifié*

**TEST 3/ En tant que client, je peux changer le compte de charges par défaut d'un fournisseur**

Je suis sur le MDS
Je pointe ma souris sur le compte de la ligne HT d'une facture
Je clique dessus, puis je change de compte de charges

*-> Une nouvelle coche doit apparaitre : "Bloquer ce compte de charges pour ce fournisseur?"*

Je clique sur la coche, puis je clique sur "Sauvegarder"

*-> Le compte doit être modifiée*

Je recharge mon navigateur, puis je pointe ma souris depuis le plan comptable sur le fournisseur en question

*-> Le compte que j'ai sélectionné doit désormais être établi comme compte par défaut*

**TEST 4/ En tant que client, je peux changer le compte de charges par défaut d'un fournisseur**

Je suis sur le MDS
Je pointe ma souris sur le compte de la ligne TVA d'une facture
Je clique dessus, puis je change de compte de TVA

*-> Une nouvelle coche doit apparaitre : "Bloquer ce compte de TVA pour ce fournisseur?"*

Je clique sur la coche, puis je clique sur "Sauvegarder"

*-> Le compte doit être modifiée*

Je recharge mon navigateur, puis je pointe ma souris depuis le plan comptable sur le fournisseur en question

*-> Le compte que j'ai sélectionné doit désormais être établi comme compte par défaut*

**TEST 5/ En tant que client, je dois nécessairement sélectionner une référence en ventes**

Je suis sur le MDS sur une facture d'achat
Je clique en haut à droite sur "Typologie"
Je sélectionne "Facture de vente"

*-> Les lignes d'écriture doivent toutes disparaître; un message doit apparaître en orange : "Cliquez ci-dessous, pour ajouter une ligne"*

Je vide la section "Référence"

*-> Cette section référence doit être entourée de rouge. Le bouton "Sauvegarder" doit rester grisé jusqu'à ce que je remplisse la référence.*

**TEST 6/ En tant que client, je peux passer d'une lettre de crédit vers facture d'achat**

Je suis sur le MDS sur une facture d'achat
Je clique en haut à droite sur "Typologie"
Je sélectionne "Lettre de crédit"

*-> Les lignes d'écriture doivent toutes disparaître; un message doit apparaître en orange : "Cliquez ci-dessous, pour ajouter une ligne"*

Je clique au milieu à gauche sur le menu déroulant "Ajouter une ligne" et je sélectionne "Effet à payer"

*-> Une ligne d'écriture "Effet à payer" doit apparaître*

Je clique à nouveau en haut à droite sur Typologie
Je sélectionne "Facture d'achat"

*-> Toutes les lignes doivent disparaître à nouveau; le message "Cliquez ci-dessous, pour ajouter une ligne" doit apparaître en orange*

**TEST 7/ En tant que client, je ne peux pas mettre une date d'échéance antérieure à la date du document**

Je suis sur le MDS sur une facture
Je change la date du document au 1e juin 2023
Je clique sur la "Date d'échéance"

*-> Je ne peux rien sélectionner avant 1e juin 2024*
