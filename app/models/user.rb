class User < ActiveRecord::Base

  validates :name,  presence: true

  validates :personalCode, :uniqueness => true

end
