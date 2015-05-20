class User < ActiveRecord::Base

  has_many :rooms

  has_secure_password

end
