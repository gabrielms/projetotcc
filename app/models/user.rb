class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :trackable, :validatable, :rememberable
  enum kind: [:admin, :coach, :pupil]

  has_one :coach

end
