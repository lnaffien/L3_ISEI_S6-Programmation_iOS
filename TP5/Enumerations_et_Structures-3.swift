import Foundation

enum Niveau
{
  case bac1
  case bac2
  case bac3
  case bac4
  case bac5
}

struct Date
{
  var annee : Int
  var mois : Int
  var jour : Int
}

struct Fiche
{
  var nom : String
  var prenom : String
  var num : Int
  var dateNaissance : Date
  var niveau : Niveau
  var moyGenerale : Int
}

func setDate(annee : Int, mois : Int, jour : Int) -> Date
{
  if(mois <= 0 || mois > 12 || jour <= 0 || jour > 31)
  {
    print("Erreur : Date invalide")
    exit(0)
  }
  return Date(annee : annee, mois : mois, jour : jour)
}

func afficheDate(date : Date)
{
  print(date.jour, "/", date.mois, "/", date.annee)
}

func remplirFiche(nom : String, prenom : String, num : Int, dateNaissance : Date, niveau : Niveau, moyGenerale : Int) -> Fiche
{
  if(moyGenerale < 0 || moyGenerale > 20)
  {
    print("Erreur : Moyenne générale invalide")
    exit(0)
  }
  return Fiche(nom : nom, prenom : prenom, num : num, dateNaissance : dateNaissance, niveau : niveau, moyGenerale : moyGenerale)  
}

func afficheFiche(fiche : Fiche)
{
  print("Nom :", fiche.nom)
  print("Prenom :", fiche.prenom)
  print("Num Etudiant unique :", fiche.num)
  print("Date de naissance :", terminator : " ")
  afficheDate(date : fiche.dateNaissance)
  print("Niveau d'étude :", fiche.niveau)
  print("Moyenne générale :", fiche.moyGenerale)
}

func getMeilleurEtudiant(fiches : [Fiche], niveau : Niveau) -> String
{
  var nomPrenom : String = "Erreur : Ces fiches ne comprennent aucun étudiant de ce niveau"
  var meilleureMoy = 0
  
  for fiche in fiches
  {
    if fiche.niveau == niveau && fiche.moyGenerale > meilleureMoy
    {
      meilleureMoy = fiche.moyGenerale
      nomPrenom = fiche.nom +  " " + fiche.prenom
    }
  }
  return nomPrenom
}


var fiches : [Fiche] = 
  [
    remplirFiche(nom : "Dupont", prenom : "Juliette", num : 1234, dateNaissance : setDate(annee : 1999, mois : 12, jour : 15), niveau : Niveau.bac3, moyGenerale : 11),
    remplirFiche(nom : "Dupont", prenom : "Jeanne", num : 1233, dateNaissance : setDate(annee : 1999, mois : 12, jour : 15), niveau : Niveau.bac3, moyGenerale : 9),
    remplirFiche(nom : "Muller", prenom : "Roger", num : 1126, dateNaissance : setDate(annee : 1996, mois : 06, jour : 7), niveau : Niveau.bac5, moyGenerale : 15),
    remplirFiche(nom : "Marechal", prenom : "Sabine", num : 1349, dateNaissance : setDate(annee : 2003, mois : 04, jour : 21), niveau : Niveau.bac1, moyGenerale : 14),
    remplirFiche(nom : "Parangon", prenom : "Jean-Michel", num : 1320, dateNaissance : setDate(annee : 2000, mois : 10, jour : 30), niveau : Niveau.bac1, moyGenerale : 18)
  ]

print(getMeilleurEtudiant(fiches : fiches, niveau : Niveau.bac1))