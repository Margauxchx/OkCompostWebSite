class UserMailer < ApplicationMailer
   default from: 'no-reply@OkCompost.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://OkCompost.fr/sign-in' 

    mail(to: @user.email, subject: 'Bienvenue dans la communauté OkCompost !') 
  end
  
  def ask_contribution_email(contribution)
    @contribution = contribution
    
    mail(to: @contribution.supplied_compost.composter.email, subject: 'Vous avez une nouvelle demande de contribution') 
  end
  
end
