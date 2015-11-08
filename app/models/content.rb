class Content < ActiveRecord::Base
	has_many :comments
	has_many :reviews

  ratyrate_rateable "score"
end