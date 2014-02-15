class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :phone, :subject, :body, :sweet_honey

  validates :sweet_honey, absence: true
  validates :name, :email, presence: true
  validates :email, format: { with:  /.+@.+\..+/ }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
