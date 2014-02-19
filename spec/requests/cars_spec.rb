require 'spec_helper'

describe 'Cars' do

  subject { page }

  describe 'car creation' do
    let(:admin) { FactoryGirl.create(:admin) }
    before { sign_in admin }

    describe 'car create' do
      before { visit new_car_path }

      context 'with invalid info' do

        it 'does not create a car' do
          expect { click_button 'Create Car' }.not_to change(Car, :count)
        end

        describe 'error messages' do
          before { click_button 'Create Car' }
          it { should have_content('error') }
        end
      end

      context 'with valid info' do

        before do
          fill_in 'Make', with: 'Toyota'
          fill_in 'Model', with: 'Altezza'
          select 'A/T', from: 'Transmission'
          select '4WD', from: 'Drive'
          fill_in 'Year', with: '2000'
          fill_in 'Seats', with: '4'
          fill_in 'Interior', with: 'Black'
          fill_in 'Exterior', with: 'Silver'
          attach_file 'car[uploads_attributes][][upload]',
          ( File.join(Rails.root, 'spec/fixtures/support/test.jpg') )
        end
        it 'should create a car' do
          expect { click_button 'Create Car' }.to change(Car, :count).by(1)
        end
      end
    end
  end

  describe '/inventory' do
    before { visit inventory_path }

    describe 'navigation' do
      describe 'is the normal main nav' do
        it { should have_selector('#main-nav') }
        it { should_not have_selector('#car-nav') }
      end
    end
  end

  # describe 'Cars#show page' do
  #   let!(:car) { FactoryGirl.create(:car) }
  #   let!(:next_car) { FactoryGirl.create(:car) }
  #   before { visit car_path(car) }

  #   describe 'navigation' do

  #     describe 'is the car details nav' do
  #       it { should have_selector('#car-nav') }
  #       it { should_not have_selector('#main-nav') }
  #     end

  #     describe 'previous and next links' do

  #       it 'knows the next car' do
  #         expect(car.next).to eq next_car
  #       end

  #       it 'knows the previous car' do
  #         expect(next_car.previous).to eq car
  #       end
  #     end
  #   end

end
