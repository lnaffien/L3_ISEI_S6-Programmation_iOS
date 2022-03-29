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