class Reply < ActiveRecord::Base
  belongs_to :poll
  has_many :answers
  belongs_to :coach

  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :coach
end
