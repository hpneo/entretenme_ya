class Content < ActiveRecord::Base
	has_many :comments
	has_many :reviews
end
