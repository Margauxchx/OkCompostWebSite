class ResultLine < ApplicationRecord
  # N - 1 association with results
  belongs_to :result, dependent: :destroy
  # N - 1 association with composts
  belongs_to :compost        
end
