class Poll < ActiveRecord::Base
	has_many :questions, :dependent => :destroy
	has_many :replies, :dependent => :destroy
	belongs_to :physical_profile
end
