func creerTableau() -> [Int]
{
  var array : [Int] = Array(1...30)
  for i in stride (from : 0, to : 30, by : 1)
  {
    array[i] *= array[i]
  }
  return array
}

func somme(ar : [Int]) -> Int
{
  return ar.reduce(0, +)
}

func produit(ar : [Int]) -> Int
{
  return ar.reduce(1, *)
}

func getIndexOf(ar : [Int], nbr : Int) -> Int
{
  for i in stride (from : 0, to : ar.count, by : 1)
  {
    if(ar[i] == nbr)
    {
      return i
    }
  }
  return -1
}

func nbrOccurences(ar : [Int], nbr : Int) -> Int
{
  var nbr_occu : Int = 0
  for item in ar
  {
    if (item == nbr)
    {
      nbr_occu += 1
    }
  }
  return nbr_occu
}

func creerTableauSansDoublons(ar : [Int]) -> [Int]
{
  var res_ar : [Int] = [Int]()

  for i in stride (from : 0, to : ar.count, by : 1)
  {
    if(nbrOccurences(ar : res_ar, nbr : ar[i]) == 0)
    {
      res_ar.append(ar[i])
    }
  }
  return res_ar  
}

func getNbrPairs(ar : [Int]) -> [Int]
{
  var res_ar : [Int] = [Int]()
  for i in stride(from : 0, to : ar.count, by : 1)
  {
    if(ar[i] % 2 == 0)
    {
      res_ar.append(ar[i])
    }
  }
  return res_ar
}

func getNbrImpairs(ar : [Int]) -> [Int]
{
  var res_ar : [Int] = [Int]()
  for i in stride(from : 0, to : ar.count, by : 1)
  {
    if(ar[i] % 2 != 0)
    {
      res_ar.append(ar[i])
    }
  }
  return res_ar
}

let ar1 : [Int] = [8, 2, 3, 0, 7]
let ar2 : [Int] = [8, 2, 3, -1, 7]
let ar3 : [Int] = [5, 2, 5, -5, 7]

print(creerTableau())
print("Somme :", somme(ar : ar1))
print("Produit :", produit(ar : ar2))
print("Index de 2 :", getIndexOf(ar : ar1, nbr : 2))
print("No. occurences de 5 :", nbrOccurences(ar : ar3, nbr : 5))
print("Tableau sans occurences :", creerTableauSansDoublons(ar : ar3))
print("Nombres pairs :", getNbrPairs(ar : ar2))
print("Nombres impairs :", getNbrImpairs(ar : ar2))