module UsersHelper
    def profile_enhencement
        if current_user  
            @user = current_user
            if @user.username == nil || @user.username == ""
                flash[:notice] = "Votre profil est incomplet. Vous pouvez le modifier #{view_context.link_to('ici', edit_user_path(@user))}"
            end
        end
    end 
end
