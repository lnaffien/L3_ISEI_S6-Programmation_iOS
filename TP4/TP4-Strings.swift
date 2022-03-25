import Foundation

let voyelles : [Character] = ["a", "e", "i", "o", "u", "y"]

func inverse (str : String) -> String
{
  var res : String = ""
  for chr in str
  {
    res = String(chr) + res
  }
  return res
}

func nbrMaj (str : String) -> Int
{
  var nbr : Int = 0
  
  for chr in str
  {
    if(chr >= "A" && chr <= "Z" )
    {
      nbr += 1
    }
  }
  return nbr
}

func nbrMin (str : String) -> Int
{
  var nbr : Int = 0
  
  for chr in str
  {
    if(chr >= "a" && chr <= "z" )
    {
      nbr += 1
    }
  }
  return nbr
}

func nbrVoy (str : String) -> Int
{
  var nbr : Int = 0
  
  for chr in str
  {
    for voy in voyelles
    {
      if(chr == voy)
      {
        nbr += 1
      }
    }    
  }
  return nbr
}

func nbrVoySimilaire (str1 : String, str2 : String) -> Bool
{
  return nbrVoy(str : str1) == nbrVoy(str : str2)
}

func estPalindrome (str : String) -> Bool
{
  let str_low : String = str.lowercased()
  let str_inverse : String = inverse(str : str)
  
  return str_low == str_inverse
}

func contient ( str : String, chr : Character) -> Bool
{
  for str_chr in str
  {
    if(str_chr == chr)
    {
      return true
    }
  }
  return false
}

func estPangramme (str : String) -> Bool
{
  let str_low : String = str.lowercased()

  for i in stride (from : 97, to : 123, by : 1)
  {
    if(!contient(str : str_low, chr : Character(UnicodeScalar(i)!)))
    {
      return false
    }
  }

  return true
  
}

func tri(str : String, separator : String) -> String
{
  var str_array : [String] = (String(describing:str)).components(separatedBy: separator)
  str_array.sort()  
  return str_array.joined(separator : separator)
}


let str1 : String = "1234abcd"
let str2 : String = "The quick Brow Fox"
let palindrome : String = "ressasser"
let pangramme : String = "The quick brown fox jumps over the lazy dog"
let str3 : String = "green-red-yellow-black-white"

print(inverse(str: str1))
print("No. de lettre majuscules :", nbrMaj(str: str2))
print("No. de lettre minuscules :", nbrMin(str: str2))
print("No. de voyelles :", nbrVoy(str: str2))
print("No. de voyelles similaire :", nbrVoySimilaire(str1: str1, str2: str2))
print("Est palindrome :", estPalindrome(str: palindrome))
print("Est pangramme :", estPangramme(str : pangramme))
print("Liste triée :", tri(str : str3, separator : "-"))