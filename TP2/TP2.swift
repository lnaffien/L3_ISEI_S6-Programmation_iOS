/*
 * Exercice 1
 */
print("Exercice 1 :")
var sexe : Int
var age : Int

print("Bonjour ! Quel est votre sexe ?")
print("0 : Masculin\n1 : Féminin")
//sexe = Int(readLine()!)!
sexe = 1

print("Quel est votre age ?")
//age = Int(readLine()!)!
age = 20

if(age >= 0)
{
  if age < 18
  {
    switch sexe
    {
      case 0 : print("Bonjour, tu as", age, " ans et tu es un garcon.")
      case 1 : print("Bonjour, tu as", age, " ans et tu es une fille.")
      default : print("Bonjour, tu as", age, "ans et il y a eu une erreur lors de la selection de ton sexe.")
    }
  }
  else
  {
    switch sexe
    {
      case 0 : print("Bonjour Monsieur, vous avez", age, "ans et vous etes un homme.")
      case 1 : print("Bonjour Madame, vous avez", age, "ans et vous etes une femme.")
      default : print("Bonjour, vous avez", age, "ans et il y a eu une erreur lors de la selection de votre sexe.")
    }
  }
}
else
{
  print("Bonjour, vous ne pouvez pas avoir un age negatif. Veuillez recommencer.")
}
print()

/*
 * Exercice 2
 */
print("Exercice 2 :")
var nbr : Int
var exp : Int = 0
print("Ici on calcule l'exponentielle ! Quel nombre voulez-vous connaitre son exponentielle ?")
//nbr = Int(readLine()!)!
nbr = 5

for i in stride(from : 1, to : nbr + 1, by : 1)
{
  exp += i
}
print("L'exponentielle de ", nbr, "est ", exp, "\n")

/*
 * Exercice 3
 */
print("Exercice 3 :")
var prix_initial : Int = 13
var reduction : Int = 0
var jour : Int
print("Quel jour sommes-nous ?")
print("1 : Lundi")
print("2 : Mardi")
print("3 : Mercredi")
print("4 : Jeudi")
print("5 : Vendredi")
print("6 : Samedi")
print("7 : Dimanche")
//jour = Int(readLine()!)!
jour = 4

if jour == 1 || jour == 4
{
  reduction = 15
}

if age <= 15 || age >= 60
{
  if jour == 6
  {
    reduction = 25
  }
  else if reduction == 0
  {
    reduction = 10
  }
}

print("Age : ", age)
print("Reduction : ", reduction, "%")
print("Prix : ", Float(prix_initial) - Float(prix_initial) * (Float(reduction) / 100), "euros\n")

/*
 * Exercice 4
 */
print("Exercice 4 :")
var c1 : String = "Hello"
var c2 : String = "World"
var c3 : String = c1 + c2
print(c3, "\n")

/*
 * Exercice 5
 */
print("Exercice 5 :")
var nbr_col : Int = 6
var nbr_lines : Int = 2

for _ in stride(from : 0, to : nbr_lines, by : 1)
{
  for _ in stride(from : 0, to : nbr_col, by : 1)
  {
    print("*", terminator : " ")
  }
 print()
}
print()

/*
 * Exercice 6
 */
print("Exercice 6 :")
var hauteur : Int
print("Quelle est la hauteur de votre sapin ?")
//hauteur = Int(readLine()!)!
hauteur = 4

while hauteur != 0
{
  for _ in stride(from : 0, to : hauteur, by : 1)
  {
    print("*", terminator: " ")
  }
  print()
  hauteur -= 1
}
print()

/*
 * Exercice 7
 * /!\ Demander comment calculer la racine
 */
print("Exercice 7 :")
var a : Int = 2
var b : Int = -9
var c : Int = -5
var delta : Float
delta = Float(b * b - 4 * a * c)

if(delta == 0)
{
  print("x = ", Float(-b / (2 * a)))
}
else if(delta > 0)
{
  print("x1 = ") // (- b - racine(delta)) / 2 * a
  print("x2 = ") // (- b + racine(delta)) / 2 * a
}
else
{
  print("Cette equation ne possede aucune solution.")
}
print()

/*
 * Exercice 8
 */
print("Exercice 8 :")
var calc : Int
var val1 : Float
var val2 : Float
print("Voulez-vous : ")
print("0 : Additionner")
print("1 : Soustraire")
print("2 : Diviser")
print("3 : Multiplier")
//calc = Int(readLine()!)!
calc = 1
print("valeur 1 :", terminator:" ")
//val1 = Float(readLine()!)!
val1 = 5
print("valeur 2 :", terminator:" ")
//val2 = Float(readLine()!)!
val2 = -9

switch calc
{
  case 0 : print(val1, " +", val2, " =", val1 + val2)
  case 1 : print(val1, " -", val2, " =", val1 - val2)
  case 2 : print(val1, " /", val2, " =", val1 / val2)
  case 3 : print(val1, " *", val2, " =", val1 * val2)
  default : print("Ce calcul ne fait pas partie de la liste, vous ne m'aurez pas comme ca !")
}
print()

/*
 * Exercice 9
 */
print("Exercice 9 :")
var an : Int
var semaine : Int
var nbr_jours : Int
print("Nombre de jours :", terminator:" ")
nbr_jours = Int(readLine()!)!

an = nbr_jours / 365
nbr_jours = nbr_jours % 365
semaine = nbr_jours / 7
nbr_jours = nbr_jours % 7
print("Annees :", an)
print("Semaines :", semaine)
print("Jours :", nbr_jours)