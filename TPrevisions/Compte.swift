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