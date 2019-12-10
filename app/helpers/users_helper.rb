# frozen_string_literal: true

module UsersHelper
  def profile_completed?(level)
    current_user.profile_completion >= level if current_user
  end

  def display_access_data?(compost)
    # conditions :
    ## composteur has always access
    ## for other users :
    ## compost is open
    ## current_user has already an accepted contribution
    current_user == compost.composter ||
      (
          compost.is_open &&
          compost.contributions.find { |x| x.contributor == current_user && x.accepted? } != nil
        )
  end

  def display_contribute_form?(compost)
    current_user != compost.composter &&
      compost.is_open
  end

  def is_owner?(compost)
    compost.composter == current_user
  end
end
