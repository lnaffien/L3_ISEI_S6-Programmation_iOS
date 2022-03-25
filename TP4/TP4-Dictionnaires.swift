func creerDict(nbr : Int) -> [Int : Int]
{
  var d = [Int : Int]()
  for i in stride(from : 1, to : nbr + 1, by : 1)
  {
    d[i] = i * i
  }
  return d
}

func afficher(dict : [String : String])
{
  for (key, val) in dict
  {
    print(key, ":", val)
  }
}

func additionner(dict1 : [String : Int], dict2 : [String : Int]) -> [String : Int]
{
  var d : [String : Int] = dict1
  for(key, val) in dict2
  {
    d[key] = val + (d[key] == nil ? 0 : (d[key])!)
  }
  return d
}

func occurences(ar : [String]) -> [String : Int]
{
  var d = [String : Int]()
  for str in ar
  {
    if(d[str] == nil)
    {
      d[str] = 1
    }
    else
    {
      d[str]! += 1
    }
  }
  return d
}

var d : [String : String] = ["nom" : "Dupuis", "prenom" : "Jacque", "age" : "30"]
var dict1 : [String : Int] = ["a": 100, "b": 200, "c":300]
var dict2 : [String : Int] = ["a": 300, "b": 200, "d":400]
let ar : [String] = ["the", "cat", "sat", "on", "the", "mat"]

print(d)

d["prenom"]! += "s"
print(d)

print(d.keys)
print(d.values)
afficher(dict : d)

print(d["prenom"]!, d["nom"]!, "a", d["age"]!, "ans.")
print(creerDict(nbr:5))

print(additionner(dict1 : dict1, dict2 : dict2))
print(occurences(ar : ar))