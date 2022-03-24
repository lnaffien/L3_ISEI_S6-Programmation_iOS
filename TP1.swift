/*
 * Exercice 1
 */
print("Exercice 1 :")
var a : Int = 5
var b : Float = 5.2
var c : String = "Hello World"

print("a :", a, "\nb :", b, "\nc :", c, "\n")

/*
 * Exercice 2
 */
print("Exercice 2 :")
var x : Int = 2
var y : Int = 3
print(x, " *", y, " =", x * y, "\n")

/*
 * Exercice 3
 */
print("Exercice 3 :")
print("Valeurs initiales :")
print("x :", x, "\ny :", y)

var temp = x
x = y
y = temp

print("Valeurs echangees :")
print("x :", x, "\ny :", y, "\n")

/*
 * Exercice 4
 */
print("Exercice 4 :")
var somme : Int = 0
var nbr = 3
for i in stride(from : 1, to : nbr + 1, by : 1)
{
  print("Valeur", i, " :")
  somme += i
  //somme += Int(readLine()!)!
}

print("La somme des nombres donnes est", somme, "\n")

/*
 * Exercice 5
 */
print("Exercice 5 :")
var moy : Float = Float(somme / nbr)
print("La moyenne des nombres donnes est", moy, "\n")

/*
 * Exercice 6
 */
print("Exercice 6 :")
Float(a) == b ? print("a = b") : Float(a) < b ? print("a < b") : print("a > b")
print()

/*
 * Exercice 7
 */
print("Exercice 7 :")
(a % 2) == 0 ? print("a est pair") : print("a est impair")
print()

/*
 * Exercice 8
 */
print("Exercice 8 :")
var choix : Int
var res : Int = 0
print("Voulez-vous calculer : ")
print("1 : le double")
print("2 : le triple")
print("3 : le carre")
//choix = Int(readLine()!)!
choix = 1

for i in stride(from : 1, to : choix + 2, by : 1)
{
  res += a
}

print(a, "*", choix + 1, " =", res, "\n")

/*
 * Exercice 9
 */
print("Exercice 9 :")
var annee : Int
print("Quelle annee voulez-vous savoir si elle est bissextile ou non ?")
annee = Int(readLine()!)!

if ( annee % 4 == 0 && annee % 100 != 0 ) || ( annee % 4 == 0 && annee % 400 == 0)
{
  print("Felicitations ! Cette annee est bissextile.")
}
else
{
 print("Dommage, ce n'est pas une annee bissextile.")
}