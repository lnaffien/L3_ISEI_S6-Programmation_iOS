import Foundation 

func creerTuple() -> (prenom: String, nom: String)
{
  return (prenom: "Lucie", nom: "Naffien")
}

func tupleToString(tuple : (String, String)) -> String
{
  return tuple.0 + " " + tuple.1
}

func get4(tuple : (String, String, String, String, String, String)) -> String
{
  return tuple.4 + " " + tuple.2
}

func toList(str : String) -> [String]
{
  return (String(describing:str)).components(separatedBy: ",")
}

func toTuple(str : String) -> (Int, Int, Int, Int, Int, Int)
{
  let ar : [String] = toList(str : str)
  return (Int(ar[0])!, Int(ar[1])!, Int(ar[2])!, Int(ar[3])!, Int(ar[4])!, Int(ar[5])!)
}

//($0.0 < $1.0) ||
func trier(list : [(nom : String, age : String, taille : String)]) -> [(nom : String, age : String, taille : String)]
{
  var list_sorted = list.sorted(by : {$0.2 < $1.2}) // taille
  list_sorted = list_sorted.sorted(by : {$0.1 < $1.1}) // age
  return list_sorted.sorted(by : {$0.0 < $1.0}) // nom 
}

let t1 = creerTuple()
let t2 = ("1", "2", "3", "4", "5", "6")
let str1 = "34,67,55,33,12,98"
print(t1)
print(tupleToString(tuple : t1))
print(get4(tuple : t2))
print(toList(str : str1))
print(toTuple(str : str1))

var l1 : [(nom : String, age : String, taille : String)] = 
[
  ("Tom", "19", "80"),
  ("John", "20", "90"),
  ("Jony", "17", "91"),
  ("Jony", "17", "93"),
  ("Json", "21", "85")
]
print(trier(list : l1))