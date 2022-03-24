import Foundation
/*
 * Exercice 0.1
 */
print("Exercice 0.1 :")

var repetition : Int
var ph : String
print("Bonjour ! Donnez moi une phrase !")
ph = "Bienvenue !"
// let phrase = readLine()
print("Donnez moi un nombre !")
// repetition = Int(readLine()!)!
repetition = 5

while(repetition != 0)
{
  // print("\(String(describing:phrase!))")
  print("\(ph)")
  repetition -= 1
}
print("")

/*
 * Exercice 0.2
 */
print("Exercice 0.2 :")

var moy : Float
moy = 0

print("Veuillez entrez les nombres dont vous voulez calculer la moyenne :")
// let str = readLine()
var str = "0 10 85 47.89 -8 104"
var nbrStr : [String] = (String(describing:str)).components(separatedBy: " ")

for number in nbrStr
{
  moy += number.floatValue
}

moy = moy / Float(nbrStr.count)
print("Moyenne : ", moy, "\n")

/*
 * Exercice 0.3
 */
print("Exercice 0.3 :")
var min : Float
var nbrTemp : Float
var n : Int

print("Combien de nombres allez-vous entrer ?")
// n = Int(readLine()!)!
n = 5
print("Nombre 1 : ", terminator : "")
// min = Float(readLine()!)!
min = -9.0

for i in stride(from : 0, to : n - 1, by : 1)
{
  print("Nombre ", i + 2, " : ", terminator : "")
  // nbrTemp = Float(readLine()!)!
  nbrTemp = Float(i)
  min = min < nbrTemp ? min : nbrTemp
}

print("Minimum : ", min, "\n")

/*
 * Exercice 1
 */
print("Exercice 1 :")
var strLst = [String](repeating : "hello", count:10)
strLst[0] = "c'est moi !"
strLst[strLst.count - 1] = "non, c'était moi !" 

print(strLst)

var strLstCopy = strLst
strLstCopy.reverse()
print(strLstCopy, "\n")

/*
 * Exercice 2
 */
print("Exercice 2 :")

let str1 : String = "Bonjour"
let str2 : String = "c'est moi !"
let str3 : String = str1 + ", " + str2
print(str3, "\n")

/*
 * Exercice 3
 */
print("Exercice 3 :")

var message : String = "Hé ben alors, on ne sait pas lire ? Le nombre doit être entre 1 et 7 ! 1 et 7 !"

print("Veuillez entrer un nombre entre 1 et 7")
// let nbrJour = Int(readLine()!)!
let nbrJour = 5

print("Version switch :")

switch nbrJour
{
  case 1 : print("Lundi")
    break;
  case 2 : print("Mardi")
    break;
  case 3 : print("Mercredi")
    break;
  case 4 : print("Jeudi")
    break;
  case 5 : print("Vendredi")
    break;
  case 6 : print("Samedi")
    break;
  case 7 : print("Dimanche")
    break;
  default : 
    print(message)
    break;
}

print("Version dictionnaire :")

let dicJour = [1 : "Lundi", 2 : "Mardi", 3 : "Mercredi", 4 : "Jeudi", 5 : "Vendredi", 6 : "Samedi", 7 : "Dimanche"]

print(dicJour[nbrJour] != nil ? dicJour[nbrJour]! : message, "\n")

/*
 * Exercice 4
 */
print("Exercice 4 :")

var pair : Int = 0
for nbr in nbrStr
{
  if(nbr.intValue % 2 == 0)
  {
    pair += 1
  }
}

print(nbrStr)
print("Nombre d'éléments pairs : ", pair)
print("Nombre d'éléments impairs : ", nbrStr.count - pair,"\n")

/*
 * Exercice 5
 */
print("Exercice 5 :")

let chaine : String = "Bonjour Elodie !"
let voyelles : [Character] = ["a", "e", "i", "o", "u", "y"]
var voyNbr : Int = 0

for char in chaine.lowercased()
{
  for voy in voyelles
  {
    if(voy == char)
    {
      voyNbr += 1
      break;
    }
    
  }
}
print("Nombre de voyelles dans \"", chaine, "\" : ", voyNbr)

/*
 * Exercice 6
 */
print("Exercice 6 :")

var arraySort = [1, 2, 98, -8, 7, 52, 3]
print("Tableau non trié : ", arraySort)
print("Tableau trié asc: ", arraySort.sorted())
print("Tableau trié desc: ", arraySort.sorted(by : >))
print()

/*
 * Exercice 7
 */
print("Exercice 7 :")
var ar1 = arraySort
var ar2 = [98, 7, 6, 15, 32, -8]
var res : [Int] = []

for val1 in ar1
{
  for val2 in ar2
  {
    if(val1 == val2)
    {
      res.append(val1)
    }
  }
}
print("Tableau 1 : ", ar1)
print("Tableau 2 : ", ar2)
print("Valeurs communes : ", res)

/*
 * Exercice 8
 */
print("Exercice 8 :")

var y : Int = 0
let dictVolaille : [String : String] = ["Rouge" : "Gorge", "Jaune" : "Canari", "Noir" : "Corbeau", "Vert" : "Canard", "Orange" : "Coq", "Bleu" : "Perroquet"]
var ar2DVolaille  = Array(repeating: (Array(repeating: "0", count: 2)), count: dictVolaille.count)

for (key, val) in dictVolaille
{
  ar2DVolaille[y][0] = key
  ar2DVolaille[y][1] = val
  y += 1
}
print(ar2DVolaille)