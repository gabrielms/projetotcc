class Coach < ActiveRecord::Base
  before_save :set_kind
  belongs_to :user

  accepts_nested_attributes_for :user

  def set_kind
  	self.user.kind = 1
  end
end
