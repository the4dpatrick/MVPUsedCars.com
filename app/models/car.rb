class Car < ActiveRecord::Base
  has_many :uploads, dependent: :destroy

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }
  scope :without_car, lambda{|car| car ? {conditions: ["id != ?", car.id]} : {} }

  validates :make, :model, :year, :seats, :transmission, :drive, :interior, :exterior, presence: true

  accepts_nested_attributes_for :uploads, allow_destroy:  true

  def previous
    Car.previous(self.id).first
  end

  def next
    Car.next(self.id).first
  end
end
