class Car < ActiveRecord::Base
  has_many :uploads, dependent: :destroy

  scope :next, ->(id) { where('id > ?', id).order('id ASC') }
  scope :previous, ->(id) { where('id < ?', id).order('id DESC') }
  scope :without_car_shuffle, lambda { |car, limit| Car.where.not(id: car.id)
                                                       .limit(limit)
                                                       .order('RANDOM()')
                              }

  validates :make, :model, :year, :seats, :transmission,
            :drive, :interior, :exterior, presence: true
  validates :uploads, presence: { message: 'You must upload at least one image' }

  accepts_nested_attributes_for :uploads, allow_destroy:  true

  def previous
    Car.previous(self.id).first
  end

  def next
    Car.next(self.id).first
  end
end
