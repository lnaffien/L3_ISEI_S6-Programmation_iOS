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