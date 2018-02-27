class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorite_user(user_id)
   favorites.find_by(user_id: user_id)
  end
  has_many :favorite_users, through: :favorites, source: :user
end
