require 'spec_helper'

describe Review do
  before do
    @review = Review.new(attributes_for(:review))
  end

  subject { @review }

  it { should respond_to(:customer) }
  it { should respond_to(:body) }
  it { should respond_to(:car) }
  it { should respond_to(:photo) }

  it { should be_valid }

  describe 'when customer is not present' do
    before { @review.customer = '' }
    it { should_not be_valid }
  end
  describe 'when body is not present' do
    before { @review.body = '' }
    it { should_not be_valid }
  end
  describe 'when model is not present' do
    before { @review.car = '' }
    it { should_not be_valid }
  end
  describe 'when photo is not present' do
    before { @review.photo = nil }
    it { should_not be_valid }
  end
end
