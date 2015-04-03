class Poll < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	has_many :replies, :dependent => :destroy
end
