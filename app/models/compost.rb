class Compost < ApplicationRecord
  acts_as_taggable_on :districts, :compositions
end
