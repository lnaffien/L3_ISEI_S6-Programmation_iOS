import Foundation

class Etudiant
{
  let nom : String
  let prenom : String
  let numEtudiant : Int
  var notes : [Int] = [Int](repeating : 0, count : 3)

  init(nom : String, prenom : String, numEtudiant : Int)
  {
    if(numEtudiant < 0)
    {
      print("Erreur : Numéro étudiant invalide")
      exit(0)
    }
    self.nom = nom
    self.prenom = prenom
    self.numEtudiant = numEtudiant
  }

  init(nom : String, prenom : String, numEtudiant : Int, notes : [Int])
  {
    if(numEtudiant < 0)
    {
      print("Erreur : Numéro étudiant invalide")
      exit(0)
    }
    self.nom = nom
    self.prenom = prenom
    self.numEtudiant = numEtudiant
    
    if notes.count > 3
    {
      print("Erreur : Cet etudiant possède trop de notes. Veuillez les rentrer manuellement")
    }
    else
    {
      for i in 0...2
      {
        if(notes[i] < 0 || notes[i] > 20)
        {
          print("Erreur : Note invalide")
        }
        else
        {
          self.notes[i] = notes[i]
        }
      }
    }
    
  }

  func modifierNote(note : Int, indice : Int)
  {
    if(note >= 0 && note <= 0 && indice > 0 && indice <= 3)
    {
      self.notes[indice - 1] = note
    }
    else
    {
      print("Erreur : Note ou indice invalide, veuillez réessayer")
    }
  }

  func getMoy() -> Float
  {
    var moy : Int = 0
    for note in notes
    {
      moy += note
    }
    return Float(moy) / Float(notes.count)
  }

  func getMin() -> Int
  {
    return notes.min()!
  }

  func getMax() -> Int
  {
    return notes.max()!
  }

  func afficherMoy()
  {
    print("Moyenne :", getMoy())
    print("Meilleure note :", getMax())
    print("Note la plus basse :", getMin())
  }

  func afficherEtudiant()
  {
    print("Nom :", self.nom)
    print("Prenom :", self.prenom)
    print("Numéro Etudiant :", self.numEtudiant)
    print("Notes :", self.notes)
  }
}

func chercherEtudiant(numEtudiant : Int, listeEtudiants : [Etudiant]) -> String
{
  for etudiant in listeEtudiants
  {
    if numEtudiant == etudiant.numEtudiant
    {
      return "Moyenne de l'étudiant " + String(numEtudiant) + " : " + String(etudiant.getMoy())
    }
  }
  return "Etudiant introuvable dans la liste donnée"
}

let etudiants : [Etudiant] =
[
  Etudiant(nom : "Dupont", prenom : "Juliette", numEtudiant : 1234, notes : [15, 11, 9]),
  Etudiant(nom : "Dupont", prenom : "Jeanne", numEtudiant : 1233, notes : [5, 18, 14])
]

etudiants[0].afficherEtudiant()
etudiants[0].afficherMoy()

print()

etudiants[1].afficherEtudiant()
etudiants[1].afficherMoy()

print()

print("Recherche de l'étudiant 1233 :")
print(chercherEtudiant(numEtudiant : 1233, listeEtudiants : etudiants))

print()

print("Recherche de l'étudiant 1230 :")
print(chercherEtudiant(numEtudiant : 1230, listeEtudiants : etudiants))