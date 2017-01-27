class Account < ActiveRecord::Base
	has_many :songs
	has_one :point
end
