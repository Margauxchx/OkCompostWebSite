module UsersHelper
    def profile_completed?(level)
        if current_user
            current_user.profile_completion >= level
        end
    end
end
