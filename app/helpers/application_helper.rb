module ApplicationHelper
    def bootstrap_class_for_flash(type)
        case type
          when 'notice' then "alert-info"
          when 'success' then "alert-success"
          when 'error' then "alert-danger"
          when 'alert' then "alert-warning"
        end
    end

    def google_map(compost)
      center = compost.latitude.to_s + ',' + compost.longitude.to_s
      # using search mode based on coordinates enables to have one pin point at the exact place of the compost
      "https://www.google.com/maps/embed/v1/search?key=#{Rails.application.credentials.google_maps_api_key}&q=#{center}"
    end

end
