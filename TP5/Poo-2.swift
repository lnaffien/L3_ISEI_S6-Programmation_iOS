/***********************************************************
 *                                                         *
 *                         COMPTE                          *
 *                                                         *
 ***********************************************************/

class Compte
{
  /*************************
   *   Variables locales   *
   *************************/
  
  var solde : Int                // solde du compte.
  var cloturer : Bool = false    // indique si le compte a été cloturé.
  
  /*************************
   *     Constructeur      *
   *************************/

  /*
   * Crée un nouveau compte bancaire.
   *
   * - Parametre :
   *     - somme : solde initiale du compte.
   */
  init(somme : Int)
  {
    self.solde = 0
    if sommeValide(somme : somme)
    {
     self.solde = somme
    }
    if somme < 0
    {
      cloturer = true
    }
  }

  /*************************
   *       Fonctions       *
   *************************/

  /*
   * Dépose de l'argent sur le compte.
   *
   * - Parametre :
   *     - somme : somme à déposer.
   */
  func deposer(somme : Int)
  {
    if sommeValide(somme : somme)
    {
      self.solde += somme
    }
  }

  /*
   * Retire de l'argent sur le compte.
   *
   * - Parametre :
   *     - somme : somme à retirer.
   *
   * - Retour : échec ou réussite du retrait.
   */
  func retirer(somme : Int) -> Bool
  {
    if sommeValide(somme : somme)
    {
      self.solde -= somme
      return true
    }
    return false
  }

  /*
   * Affiche le solde du compte.
   */
  func afficher()
  {
    print("Solde", type(of:self), ":", solde)
  }

  /*
   * Vire de l'argent sur un autre compte.
   *
   * - Parametres :
   *     - destinataire : compte destinataire du virement.
   *     - somme : somme à virer.
   */
  func virerVers(destinataire : Compte, somme : Int)
  {
    if sommeValide(somme : somme)
    {
      if self.retirer(somme : somme)
      {
        destinataire.deposer(somme : somme)
      }      
    }
  }

  /*
   * Vérifie la validité de la somme donnée.
   *
   * - Parametre :
   *     - somme : somme dont la validité est à vérifier.
   *
   * - Retour : validité de la somme donnée.
   */
  func sommeValide(somme : Int) -> Bool
  {
    if somme <= 0
    {
      print("Erreur : Transactions impossibles avec un montant nul ou négatif")
    }
    return somme > 0
  }
  
}

/***********************************************************
 *                                                         *
 *                     COMPTE COURANT                      *
 *                                                         *
 ***********************************************************/

class CompteCourant : Compte
{
   /*************************
   *       Fonctions       *
   *************************/

  /*
   * Retire de l'argent sur le compte.
   *    Empêche tout retrait si le compte risque d'être à découvert.
   *
   * - Parametre :
   *     - somme : somme à retirer.
   *
   * - Retour : échec ou réussite du retrait.
   */
  override func retirer(somme : Int) -> Bool
  {
    if self.solde - somme >= 0
    {
      return super.retirer(somme : somme)      
    }
    else
    {
      print("Erreur : Retrait impossible, risque de découvert")
      return false
    }    
  }
  
}

/***********************************************************
 *                                                         *
 *                    COMPTE LIVRET A                      *
 *                                                         *
 ***********************************************************/

class LivretA : Compte
{
  
  /*************************
   *     Constructeur      *
   *************************/

  /*
   * Crée un nouveau compte bancaire.
   *     Empêche la création si le solde initiale est insuffisant (inférieur à 10euros).
   *
   * - Parametre :
   *     - somme : solde initiale du compte.
   */  
  override init(somme : Int)
  {
    if(somme < 10)
    {
      print("Erreur : Un livret A nécessite un solde minimun de 10euros")
      super.init(somme : 0)
      self.cloturer = true
    }
    else
    {
      super.init(somme : somme)
    }
  }

  /*************************
   *       Fonctions       *
   *************************/

  /*
   * Retire de l'argent sur le compte.
   *     Bloque le retrait depuis un livret A.
   *
   * - Parametre :
   *     - somme : somme à retirer.
   *
   * - Retour : échec ou réussite du retrait.
   */  
  override func retirer(somme : Int) -> Bool
  {
    print("Erreur : Impossible de retirer depuis un livret A")
    return false
  }

  /*
   * Vire de l'argent sur un autre compte.
   *     Vérifie le solde du compte après le virement.
   *
   * - Parametres :
   *     - destinataire : compte destinataire du virement.
   *     - somme : somme à virer.
   */
  override func virerVers(destinataire : Compte, somme : Int)
  {
    if sommeValide(somme : somme)
    {
      if(somme > self.solde)
      {
        destinataire.deposer(somme : self.solde)
      }
      else
      {
        destinataire.deposer(somme : somme)
      }
      self.solde -= somme      
      cloturer()
    }
  }

  /*
   * Vérifie le solde du compte.
   *    Le cloture s'il est insuffisant.
   */
  func cloturer()
  {
    if self.solde < 10
    {      
      print("Vous avez moins de 10euros sur le livret A, il a donc été cloturé")
      self.cloturer = true
      self.solde = 0
    }
  }
}

/***********************************************************
 *                                                         *
 *                     COMPTE EPARGNE                      *
 *                                                         *
 ***********************************************************/

class CompteEpargne : Compte
{

  /*************************
   *     Constructeur      *
   *************************/

  /*
   * Crée un nouveau compte bancaire.
   *     Empêche la création si le solde initiale est insuffisant (inférieur à 200euros).
   *
   * - Parametre :
   *     - somme : solde initiale du compte.
   */  
  override init(somme : Int)
  {
    if(somme < 200)
    {      
      print("Erreur : Ouvrir un compte épargne recquiert d'y déposer 200euros minimum")
      super.init(somme : 0)
      self.cloturer = true
    }
    else
    {
      super.init(somme : somme)
    }    
  }

  /*************************
   *       Fonctions       *
   *************************/

  /*
   * Retire de l'argent sur le compte.
   *     Bloque le retrait depuis un compte épargne.
   *
   * - Parametre :
   *     - somme : somme à retirer.
   *
   * - Retour : échec ou réussite du retrait.
   */  
  override func retirer(somme : Int) -> Bool
  {
    print("Erreur : Impossible de retirer depuis un compte épargne")
    return false
  }

  /*
   * Vire de l'argent sur un autre compte.
   *     Vire l'intégralité du solde de ce compte et le cloture.
   *
   * - Parametres :
   *     - destinataire : compte destinataire du virement.
   *     - somme : somme à virer.
   */
  override func virerVers(destinataire : Compte, somme : Int)
  {
    destinataire.deposer(somme : self.solde)
    self.solde = 0
    print("L'intégralité de votre compte épargne vient d'être virée vers le destinataire")
      self.cloturer = true
  }
}

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

  /*
   * Ajoute un nouveau compte au client.
   *
   * - Paramètre : 
   *     - compte : compte à ajouter.
   */
  func ajouterCompte(compte : Compte)
  {
    if !compte.cloturer
    {
      comptes.append(compte)
    }    
  }

  /* 
   * Supprime un compte au client.
   *
   * - Paramètre : 
   *     - compte : compte à supprimer.
   */
  func supprimerCompte(compte : Compte)
  { 
    let index = getCompteIndex(compte : compte)
    if(index < 0)
    {
      print("Erreur : Compte invalide")
    }
    else
    {
      comptes.remove(at: index)
    }    
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
    if(index >= 0)
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
    if(index >= 0)
    {
      comptes[index].retirer(somme : somme)
      
      if(comptes[index].cloturer)
      {
        supprimerCompte(compte : comptes[index])
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
    
    if(index_de >= 0 && index_vers >= 0 && index_de != index_vers)
    {
      comptes[index_de].virerVers(destinataire : comptes[index_vers], somme : somme)
      if(comptes[index_de].cloturer)
      {
        supprimerCompte(compte : comptes[index_de])
      }
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
  private func getCompteIndex(compte : Compte) -> Int
  {
    for i in stride(from : 0, to : comptes.count, by : 1)
    {
      if type(of: comptes[i]) == type(of: compte) && comptes[i].solde == compte.solde
      {
        return i
      }
    }
    print("Erreur : Compte inexistant")
    return -1
  }  
}

/***********************************************************
 *                                                         *
 *                         MAIN                            *
 *                                                         *
 ***********************************************************/

var client : Client = Client()

var c1 = CompteCourant(somme : 50)
var c2 = CompteCourant(somme : -3)
var e1 = CompteEpargne(somme : 10)
var e2 = CompteEpargne(somme : 230)
var a1 = LivretA(somme : 5)
var a2 = LivretA(somme : 45)

client.ajouterCompte(compte : c1)
client.ajouterCompte(compte : c2)
client.ajouterCompte(compte : e1)
client.ajouterCompte(compte : e2)
client.ajouterCompte(compte : a1)
client.ajouterCompte(compte : a2)

print()
client.afficherTout()
print()
client.retirer(compte : c1, somme : 20)
client.retirer(compte : c2, somme : 20)
client.retirer(compte : e1, somme : 20)
client.retirer(compte : e2, somme : 20)
client.retirer(compte : a1, somme : 20)
client.retirer(compte : a2, somme : 20)
print()
client.afficherTout()
print()
client.deposer(compte : c1, somme : 55)
client.deposer(compte : c2, somme : 55)
client.deposer(compte : e1, somme : 55)
client.deposer(compte : e2, somme : 55)
client.deposer(compte : a1, somme : 55)
client.deposer(compte : a2, somme : 55)
print()
client.afficherTout()
print()
client.virerVers(de : c1, vers : c1, somme : 40)
client.virerVers(de : c1, vers : c2, somme : 40)
client.virerVers(de : c1, vers : e2, somme : 40)
client.virerVers(de : c1, vers : a2, somme : 40)
print()
client.afficherTout()
print()
client.virerVers(de : c2, vers : c2, somme : 40)
client.virerVers(de : c2, vers : c1, somme : 40)
client.virerVers(de : c2, vers : e2, somme : 40)
client.virerVers(de : c2, vers : a2, somme : 40)
print()
client.afficherTout()
print()
client.virerVers(de : e1, vers : c1, somme : 40)
client.virerVers(de : e1, vers : c2, somme : 40)
client.virerVers(de : e1, vers : e2, somme : 40)
client.virerVers(de : e1, vers : a2, somme : 40)
print()
client.afficherTout()
print()
client.virerVers(de : e2, vers : e2, somme : 40)
client.virerVers(de : e2, vers : c2, somme : 40)
client.virerVers(de : e2, vers : c1, somme : 40)
client.virerVers(de : e2, vers : a2, somme : 40)
print()
client.afficherTout()
print()
client.virerVers(de : a2, vers : a2, somme : 135)
client.virerVers(de : a2, vers : c1, somme : 155)
print()
client.afficherTout()
print()