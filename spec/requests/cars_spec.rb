require 'spec_helper'

describe "Cars" do
  describe "/inventory" do
    before { visit inventory_path }
    subject { page }

    describe "navigation" do
      describe "is the normal main nav" do
        it { should have_selector("#main-nav") }
        it { should_not have_selector("#car-nav") }
      end
    end
  end

  describe "Cars#show page" do
    before { visit car_show_path }
    subject { page }

    describe "navigation" do
      describe "is the car details nav" do
        it { should have_selector("#car-nav") }
        it { should_not have_selector("#main-nav") }
      end
    end
  end
end
