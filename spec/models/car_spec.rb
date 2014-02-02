require 'spec_helper'

describe Car do
  before do
    @car = Car.new(attributes_for(:car))
  end

  it { should respond_to(:make) }
  it { should respond_to(:model) }
  it { should respond_to(:year) }
  it { should respond_to(:seats) }
  it { should respond_to(:transmission) }
  it { should respond_to(:drive) }
  it { should respond_to(:interior) }
  it { should respond_to(:exterior) }

  context "when make is not present" do
    before { @car.make = '' }
    it { should_not be_valid }
  end
  context "when make is not present" do
    before { @car.make = '' }
    it { should_not be_valid }
  end
  context "when model is not present" do
    before { @car.model = '' }
    it { should_not be_valid }
  end
  context "when year is not present" do
    before { @car.year = '' }
    it { should_not be_valid }
  end
  context "when seats is not present" do
    before { @car.seats = '' }
    it { should_not be_valid }
  end
  context "when transmission is not present" do
    before { @car.transmission = '' }
    it { should_not be_valid }
  end
  context "when interior is not present" do
    before { @car.interior = '' }
    it { should_not be_valid }
  end
  context "when exterior is not present" do
    before { @car.exterior = '' }
    it { should_not be_valid }
  end
end
