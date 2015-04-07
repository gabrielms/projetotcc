class Question < ActiveRecord::Base
  belongs_to :poll
  belongs_to :workout  
  has_many :possible_answers, :dependent => :destroy
  has_many :answers, :dependent => :destroy

  accepts_nested_attributes_for :possible_answers
end
