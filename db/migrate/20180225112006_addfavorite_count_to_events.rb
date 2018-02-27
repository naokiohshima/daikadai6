class AddfavoriteCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :favorite_count, :integer
  end
end
