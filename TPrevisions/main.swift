/***********************************************************
 *                                                         *
 *                         MAIN                            *
 *                                                         *
 ***********************************************************/

var client : Client = Client(nom : "Dupont", prenom : "Juliette", adresse : Adresse(numRue : 56, nomRue : "rue de la Banque", numDepartement : 58000), numTelephone : "123456789")
var conseiller = Conseiller()

var c1 = CompteCourant(somme : 50)
var c2 = CompteCourant(somme : -3)
var e1 = CompteEpargne(somme : 10)
var e2 = CompteEpargne(somme : 230)
var a1 = LivretA(somme : 5)
var a2 = LivretA(somme : 45)

conseiller.ajouterCompte(client : client, compte : c1)
conseiller.ajouterCompte(client : client, compte : c2)
conseiller.ajouterCompte(client : client, compte : e1)
conseiller.ajouterCompte(client : client, compte : e2)
conseiller.ajouterCompte(client : client, compte : a1)
conseiller.ajouterCompte(client : client, compte : a2)

print()
client.afficherTout()
print()
client.deposer(compte : c1, somme : 15)
print()
client.afficherTout()
print()
client.retirer(compte : c1, somme : 30)
print()
client.afficherTout()
print()