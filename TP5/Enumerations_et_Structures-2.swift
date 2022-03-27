import Foundation

struct Heure
{
  var heure : Int
  var minute : Int
  var seconde : Int

  init(heure : Int, minute : Int, seconde : Int)
  {
    if(heure < 0 || heure > 23)
    {
      print("Erreur : heure invalide.")
      exit(0)
    }
    if(minute < 0 || minute > 60)
    {
      print("Erreur : minute invalide.")
      exit(0)
    }
    if(seconde < 0 || seconde > 60)
    {
      print("Erreur : seconde invalide.")
      exit(0)
    }

    self.heure = heure
    self.minute = minute
    self.seconde = seconde
  }
}

func afficher(heure : Heure)
{
  print(heure.heure, ":", heure.minute, ":", heure.seconde)
}

func getHeure() -> Heure
{
  print("Quelle heure est-il ?")
  let h = Int(readLine()!)!
  print("Combien de minutes y-a-t'il ?")
  let m = Int(readLine()!)!
  print("Combien de secondes y-a-t'il ?")
  let s = Int(readLine()!)!
  
  return Heure(heure : h, minute : m, seconde : s)
}

/*
 * Compare deux Heure données.
 *
 * - Paramètres : 
 *     - h1 : heure 1.
 *     - h2 : heure 2.
 * 
 * -Retour : vrai si h1 est supérieure ou égale à h2, faux sinon.
 */
func comparer(h1 : Heure, h2 : Heure) -> Bool
{
  return h1.heure == h2.heure ?
          (h1.minute == h2.minute ?
            (h1.seconde == h2.seconde ? true : h1.seconde >= h2.seconde) : 
          h1.minute >= h2.minute) :
        h1.heure >= h2.heure
}

let h1 = getHeure()
// let h1 = Heure(heure : 11, minute : 12, seconde : 35)
let h2 = Heure(heure : 11, minute : 12, seconde : 45)
afficher(heure : h1)
afficher(heure : h2)
print(comparer(h1 : h1, h2 : h2))
print(comparer(h1 : h2, h2 : h1))
print(comparer(h1 : h1, h2 : h1))