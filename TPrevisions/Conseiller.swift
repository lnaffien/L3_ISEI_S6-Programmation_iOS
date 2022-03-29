class Conseiller
{
  /*
   * Ajoute un nouveau compte au client.
   *
   * - Paramètre : 
   *     - compte : compte à ajouter.
   */
  func ajouterCompte(client : Client, compte : Compte)
  {
    if !compte.cloturer
    {
      client.comptes.append(compte)
    }  
  }

  /* 
   * Supprime un compte au client.
   *
   * - Paramètre : 
   *     - compte : compte à supprimer.
   */
  func supprimerCompte(client : Client, compte : Compte)
  { 
    let index = client.getCompteIndex(compte : compte)
    if(index < 0)
    {
      print("Erreur : Compte invalide")
    }
    else
    {
      client.comptes[index].cloturer = true
      client.comptes.remove(at: index)
    }    
  }
}