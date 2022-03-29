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