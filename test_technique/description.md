# TEST TECHNIQUE
Chaintrust génère pour ses clients des fichiers d'écritures comptables, selon des documentations prévues par les logiciels comptables.  
Ces fichiers sont ensuite téléchargés par les clients, qui les téléversent directement dans leur logiciel comptable.  

La documentation technique est décrite dans le fichier documentation.pdf  
Le programme qui génère le fichier d'écritures selon cette documentation est le fichier accounting_file_generator.rb.  
Ce programme peut être facilement lancé depuis un terminal en exécutant la commande ruby test_technique/accounting_file_generator.rb à la racine de ce repository.  
Le fichier généré par le programme (pour exemple) est le fichier writing.txt  
Les données comptables utilisées par le programme sont stockées dans le fichier invoices.json  

En résumé : le programme accounting_file_generator.rb, quand il est exécuté, prend en entrée le fichier invoices.json et renvoie en sortie le fichier writing.txt.  
Ce programme est censé suivre fidèlement la documentation telle qu'elle est écrite dans le fichier documentation.pdf  

Malheureusement, l'un de nos clients s'est plaint de son fichier d'écritures.  
En effet, selon ce client, les écritures arrivent avec un "code lettrage" alors que cela ne devrait pas être le cas !  
L'équipe technique est trop occupée pour gérer ce problème.   
Il va falloir leur donner un peu de soutien.   

Votre mission, si vous l'acceptez, est de repérer dans le code s'il y a un bug.  
S'il y a un bug, il faut faire un rapport de bug précis à destination des développeurs.  
S'il n'y a pas de bug, il faut écrire une réponse au client.  

Ecrivez donc soit la réponse au client, soit le rapport de bug et envoyez la nous par mail, au contact indiqué dans le fichier README.md de ce repository.  
