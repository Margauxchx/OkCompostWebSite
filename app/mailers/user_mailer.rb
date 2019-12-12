class UserMailer < ApplicationMailer
   default from: 'no-reply@OkCompost.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://ok-compost-staging.herokuapp.com' 

    mail(to: @user.email, subject: 'Bienvenue dans la communauté OkCompost !') 
  end
  
  def ask_contribution_email(contribution)
    @contribution = contribution
    
    mail(to: @contribution.supplied_compost.composter.email, subject: 'Vous avez une nouvelle demande de contribution') 
  end
  
  def valid_contribution_email(contribution)
    @contribution = contribution
    
    mail(to: @contribution.contributor.email, subject: 'Validation de votre contribution') 
  end
  
  def reject_contribution_email(contribution)
    @contribution = contribution
    
    mail(to: @contribution.contributor.email, subject: 'Rejet de votre contribution') 
  end
  
end
