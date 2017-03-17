class User < ActiveRecord::Base
  has_many :movies
  has_many :comments
end
