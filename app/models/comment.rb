class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :content, presence: true
end
