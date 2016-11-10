class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  validates :user_id, presence: true
  validates :content, presence: true, length: {minimum: 6, maximum: 140}

  paginates_per 6
end
