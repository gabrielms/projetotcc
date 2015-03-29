class Answer < ActiveRecord::Base
  belongs_to :coach
  belongs_to :workout
end
