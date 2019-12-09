module ApplicationHelper
    def bootstrap_class_for_flash(type)
        case type
          when 'notice' then "alert-info"
          when 'success' then "alert-success"
          when 'error' then "alert-danger"
          when 'alert' then "alert-warning"
        end
    end

    def google_map(center)
      "https://www.google.com/maps/embed/v1/place?key=#{Rails.application.credentials.google_maps_api_key}&q=#{center}"
    end

end
