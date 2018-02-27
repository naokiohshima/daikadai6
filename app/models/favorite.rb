class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :event, counter_cache: :favorite_count

end
