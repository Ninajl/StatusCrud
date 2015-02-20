class Facebook < ActiveRecord::Base
  validates :status, :user, :likes, presence: true
end
