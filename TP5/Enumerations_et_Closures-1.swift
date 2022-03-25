enum Genre
{
  case garçon
  case fille
}

enum Niveau
{
  case cp
  case ce1
  case ce2
  case cm1
  case cm2
}

struct Eleve
{
  var nom : String
  var age : Int
  var genre : Genre
  var niveau : Niveau
}

func getNiveau(eleves : [Eleve], niveau : Niveau) -> [Eleve]
{
  var res = [Eleve]()
  for eleve in eleves
  {
    if(eleve.niveau == niveau)
    {
      res.append(eleve)
    }
  }
  return res
}

let sarah : Eleve = Eleve(nom : "Sarah", age : 7, genre : Genre.fille, niveau : Niveau.cp)
let antoine : Eleve = Eleve(nom : "Antoine", age : 9, genre : Genre.garçon, niveau : Niveau.ce2)
let marie : Eleve = Eleve(nom : "Marie", age : 9, genre : Genre.fille, niveau : Niveau.ce2)
let théo : Eleve = Eleve(nom : "Théo", age : 10, genre : Genre.garçon, niveau : Niveau.cm1)
let eleves : [Eleve] = [sarah, antoine, marie, théo]

print(getNiveau(eleves : eleves, niveau : Niveau.ce2))