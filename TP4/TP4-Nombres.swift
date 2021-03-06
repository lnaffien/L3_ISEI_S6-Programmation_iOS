import Foundation

func additionner(a : Float, b : Float) -> Float
{
  return a + b
}

func soustraire(a : Float, b : Float) -> Float
{
  return a - b
}

func multiplier(a : Float, b : Float) -> Float
{
  return a * b
}

func diviser(a : Float, b : Float) -> Float
{
  return a / b
}

func max(a : Float, b : Float, c : Float) -> Float
{
  return (a > b && a > c) ? 
    a : (b > c) ? 
      b : c
}

func fact(a : Float) -> Float
{
  if(a > 0)
  {
    return a * fact(a : a - 1)
  }
  else
  {
    return 1
  }  
}

func estDansLIntervalle(val : Float, i1 : Float, i2 : Float) -> Bool
{
  if( i1 > i2)
  {
    return val >= i2 && val <= i1
  }
  else
  {
    return val >= i1 && val <= i2
  }
}

func estPremier(val : Int) -> Bool
{
  if(val > 1)
  {
    for i in stride(from : 2, to : val, by : 1)
    {
      if(val % i == 0)
      {
        return false
      }
    }
  }
  return true  
}

func estParfait(val : Int) -> Bool
{
  if(val < 1)
  {
    return false
  }
  
  var somme : Int = 0
  for i in stride(from : 1, to : val, by : 1)
  {
    if(val % i == 0)
    {
      somme += i
    }
  }
  return somme == val
}



let var1 : Float = 3.9
let var2 : Float = 5.0
let var3 : Float = 8.9

print("Quelle opération voulez-vous effectuer ?")
print("1 : Addition")
print("2 : Soustraction")
print("3 : Multiplication")
print("4 : Division")
print("5 : Maximum")
print("6 : Factorielle")
print("7 : Intervalle")
print("8 : Premier")
print("9 : Parfait")
var op = Int(readLine()!)!
var res : Float

switch op
{
  case 1 : res = additionner(a:var1, b:var2)
    break
  case 2 : res = soustraire(a:var1, b:var2)
    break
  case 3 : res = multiplier(a:var1, b:var2)
    break
  case 4 : res = diviser(a:var1, b:var2)
    break
  case 5 : res = max(a:var1, b:var2, c:var3)
    break
  case 6 : res = fact(a:var2)
    break
  case 7 : res = estDansLIntervalle(val:var2, i1:var3, i2:var1) ? 1 : 0
    break
  case 8 : res = estPremier(val: Int(var2)) ? 1 : 0
    break
  case 9 : res = estParfait(val: Int(6)) ? 1 : 0
  default : 
  
    print("Erreur : numéro d'opération invalide")
    exit(0)
}
  
print(res)
