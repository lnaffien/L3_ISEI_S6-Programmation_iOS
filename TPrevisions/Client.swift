/***********************************************************
 *                                                         *
 *                         CLIENT                          *
 *                                                         *
 ***********************************************************/

class Client
{
  /*************************
   *   Variables locales   *
   *************************/
  
  var comptes = [Compte]()
  var nom : String
  var prenom : String
  var adresse : Adresse
  var numTelephone : String

  init(nom : String, prenom : String, adresse : Adresse, numTelephone : String)
  {
    self.nom = nom
    self.prenom = prenom
    self.adresse = adresse
    self.numTelephone = numTelephone
  }
  
  /* 
   * Affiche le compte client donné.
   * 
   * - Paramètre : 
   *     - compte : compte à afficher.
   */
  func afficher(compte : Compte)
  {
    comptes[getCompteIndex(compte : compte)].afficher()
  }

  /* 
   * Affiche l'intégralité des comptes de ce client.
   */
  func afficherTout()
  {
    for compte in comptes
    {
      compte.afficher()
    }
  }

  /*
   * Dépose de l'argent sur le compte client donné.
   *
   * - Paramètres : 
   *     - compte : compte où déposer l'argent.
   *     - somme : somme à déposer.
   */
  func deposer(compte : Compte, somme : Int)
  {
    let index = getCompteIndex(compte : compte)
    if(compte.cloturer)
    {
      print("Erreur : Ce compte a été cloturé")
    }
    else if(index >= 0)
    {
      comptes[index].deposer(somme : somme)
    }
  }

  /*
   * Retire de l'argent sur le compte client donné.
   *
   * - Paramètres : 
   *     - compte : compte où retirer de l'argent.
   *     - somme : somme à retirer.
   */
  func retirer(compte : Compte, somme : Int)
  {
    let index = getCompteIndex(compte : compte)
    if(comptes[index].cloturer)
    {
      print("Erreur : Ce compte a été cloturé")
    }
    else if(index >= 0)
    {
      comptes[index].retirer(somme : somme)
      
      if(comptes[index].cloturer)
      {
        print("Solde ")
      }
    }
    
  }

  /*
   * Virer de l'argent d'un compte client donné à un autre.
   *     Rien n'est effectué si les comptes données sont similaires ou invalides.
   *     Supprime le compte si le virement entraîne sa cloturation.
   *
   * - Paramètres : 
   *     - de : compte où retirer l'argent.
   *     - vers : compte où déposer l'argent.
   *     - somme : somme à virer.
   */
  func virerVers(de : Compte, vers : Compte, somme : Int)
  {   
    let index_de = getCompteIndex(compte : de)
    let index_vers = getCompteIndex(compte : vers)

    if(de.cloturer || vers.cloturer)
    {
      print("Erreur : Ce compte a été cloturé")
    }    
    else if(index_de >= 0 && index_vers >= 0 && index_de != index_vers)
    {
      comptes[index_de].virerVers(destinataire : comptes[index_vers], somme : somme)
    }  
  }

  /*
   * Récupère l'index du compte client donné dans la liste de ses comptes.
   *     Récupère le premier compte ayant un type et un solde similaires à celui donné.
   *
   * - Paramètres : 
   *     - compte : compte où récupérer l'index.
   *
   * - Retour : index du compte donné dans la liste des comptes du client.
   */
  func getCompteIndex(compte : Compte) -> Int
  {
    if !compte.cloturer
    {
      for i in stride(from : 0, to : comptes.count, by : 1)
      {
        if type(of: comptes[i]) == type(of: compte) && comptes[i].solde == compte.solde
        {
          return i
        }
      }
      print("Erreur : Compte inexistant")
    }
    
    return -1
  }  
}