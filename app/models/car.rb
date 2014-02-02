class Car < ActiveRecord::Base
  validates :make, :model, :year, :seats, :transmission, :drive, :interior, :exterior, presence: true
end
