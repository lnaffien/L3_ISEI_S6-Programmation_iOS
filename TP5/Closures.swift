var nbrMax : (Int, Int) -> Int = { nbr1, nbr2 in
    return nbr1 > nbr2 ? nbr1 : nbr2
  }

var somme : (Int, Int, Int) -> Int = { nbr1, nbr2, nbr3 in
    return nbr1 + nbr2 + nbr3
  }

var listMin : ([Int]) -> Int = { list in
    return list.min()!                             
  }

var nbrMaj : (String) -> Int = { str in
    var nbr : Int = 0
    for char in str
    {
      if(char >= "A" && char <= "Z")
      {
        nbr += 1
      }
    }
    return nbr
  }


var nb1 = 5
var nb2 = 8
var nb3 = -4
var list = [nb1, nb2, nb3]
var str = "Ceci est le TP5 du cours de Swift."

print(list)
print("No. max :", nbrMax(nb1, nb2))
print("Somme :", somme(nb1, nb2, nb3))
print("No. list min", listMin(list))
print(str)
print("No. majuscules :", nbrMaj(str))