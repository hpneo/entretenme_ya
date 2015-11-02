class Content < ActiveRecord::Base
	has_many :comments
	has_many :reviews
end
class User < ActiveRecord::Base
  ratyrate_rater
end
