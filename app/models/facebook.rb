class Facebook < ActiveRecord::Base
  validates :status, :user, presence: true 
end
