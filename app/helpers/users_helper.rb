module UsersHelper
    
    def profile_completed?(level)
        if current_user
            current_user.profile_completion >= level
        end
    end

    def display_access_data?(compost)
        compost.contributions.find{ |x| x.contributor == current_user && x.accepted? } != nil
    end

    def is_owner?(compost)
        compost.composter == current_user
    end 
end
