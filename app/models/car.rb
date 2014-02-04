class Car < ActiveRecord::Base
  has_many :uploads

  validates :make, :model, :year, :seats, :transmission, :drive, :interior, :exterior, presence: true

  accepts_nested_attributes_for :uploads, allow_destroy:  true

  #http://stackoverflow.com/questions/2672744/rails-activerecord-find-all-users-except-current-user/2674308#2674308
  scope :without_car, lambda{|car| car ? {conditions: ["id != ?", car.id]} : {} }

end
