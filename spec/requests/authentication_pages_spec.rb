require 'spec_helper'

describe 'Authentication' do
  subject { page }

  describe 'sign in page' do
    before { visit signin_path }

    it { should have_content 'Sign in' }
    it { should have_title 'Sign in' }
  end

  describe 'sign in' do

    before { visit signin_path }

    context 'with invalid information' do
      before { click_button 'Sign in' }

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-box') }

      describe 'after visiting another page' do
        before { click_link 'Inventory' }
        it { should_not have_selector('div.alert.alert-box') }
      end
    end

    context 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_css("img[src*='simple-logo.png']") }
      it { should have_selector('.top-bar') }
      it { should have_title(user.name) }
      it { should have_link('Settings', edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe 'followed by signout' do
        before { click_link 'Sign out' }

        it { should have_title('Sign in') }
      end
    end
  end

  describe 'authorization' do

    context 'for non-signed-in users' do
      let(:user) { FactoryGirl.create(:user) }

      describe 'when attempting to visit a protected page' do
        before do
          visit edit_user_path(user)
          fill_in 'Email', with: user.email
          fill_in 'Password', with: user.password
          click_button 'Sign in'
        end

        describe 'after signing in' do

          it 'should render the desired protected page' do
            expect(page).to have_title('Update profile')
          end

          describe 'when signing in again' do
            before do
              visit dashboard_path
              click_link 'Sign out'
              sign_in user
            end

            it 'should render the dashboard' do
              expect(page).to have_title('Dashboard')
            end
          end
        end
      end

      describe 'in the Cars controller' do

        describe 'submitting to the create action' do
          before { post cars_path }
          specify { expect(response).to redirect_to(signin_path) }

          describe 'attempt to sign in as a non-admin after redirect' do
            before do
              visit new_car_path
              fill_in 'Email', with: user.email
              fill_in 'Password', with: user.password
              click_button 'Sign in'
            end

            specify { expect(response).to redirect_to(signin_path) }
            it { should have_selector('div.alert-box.alert', text: 'Access Denied') }
          end
        end

      #   describe 'submitting to the destroy action' do
      #     let(:car) { FactoryGirl.create(:car) }
      #     before { delete car_path(car) }
      #     specify { expect(response).to redirect_to(signin_path) }

      #     describe 'attempt to sign in as a non-admin after redirect' do
      #       before do
      #         visit new_car_path
      #         fill_in 'Email', with: user.email
      #         fill_in 'Password', with: user.password
      #         click_button 'Sign in'
      #       end

      #       specify { expect(response).to redirect_to(signin_path) }
      #       it { should have_selector('div.alert-box.alert', text: 'Access Denied') }
      #     end
      #   end
      end

      describe 'in the Users controller' do

        describe 'visiting the edit page' do
          before { visit edit_user_path(user) }
          it { should have_title('Sign in') }
          it { should have_selector('div.alert-box.secondary') }
        end

        describe 'submitting to the update action' do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe 'profile page' do
          before { visit user_path(user) }
          it { should have_title('Sign in') }
          it { should have_selector('div.alert-box.secondary') }
        end

        describe 'visiting the user index' do
          before { visit users_path }
          it { should have_title('Sign in') }
        end
      end
    end

    context 'as wrong user' do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: 'wrong@example.com') }
      before { sign_in user }

      describe 'submitting a GET request to the Users#edit action' do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match('Edit user') }
        specify { expect(response).to redirect_to(signin_path) }
      end

      describe 'submitting a PATCH request to the Users#update action' do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(signin_path) }
      end

      describe 'submitting a GET request to the Users#show action' do
        before { get user_path(wrong_user) }
        specify { expect(response.body).not_to match(user.name) }
        specify { expect(response).to redirect_to(signin_path) }
      end
    end
  end
end
