class UserMailer < ApplicationMailer
   default from: 'no-reply@OkCompost.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://monsite.fr/login' 

    mail(to: @user.email, subject: 'Bienvenue dans la communauté OkCompost !') 
  end
  
end
