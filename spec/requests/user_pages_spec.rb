require 'spec_helper'

describe 'User Pages' do

  subject { page }

  describe 'index' do
    context 'as an admin user' do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        sign_in admin
        visit users_path
      end

      it { should have_title('All users') }
      it { should have_content('All users') }

      describe 'pagination' do
        before do
          admin.delete
          DatabaseCleaner.clean
        end
        before(:all) { 30.times { FactoryGirl.create(:user) } }
        after(:all) { DatabaseCleaner.clean }

        it { should have_selector('ul.pagination') }

        it 'lists each user' do
          User.all.each do |user|
            expect(page).to have_selector('li', text: user.name)
          end
        end
      end

      describe 'delete links' do

        it { should have_link('delete') }
        it { should have_link('delete', href: user_path(User.first)) }

        it 'should be able to delete another user' do
          expect do
            click_link('delete', match: :first)
          end.to change(User, :count).by(-1)
        end

        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end

    describe 'navigation' do
      let(:user) { FactoryGirl.create(:user) }
      before { visit users_path }
      it { should have_css("img[src*='simple-logo.png']") }
      it { should have_selector('.top-bar') }
    end
  end

  describe 'edit' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe 'page' do
      it { should have_content('Update your profile') }
      it { should have_title('Update profile') }
    end

    context 'with invalid information' do
      before { click_button 'Save changes' }

      it { should have_selector('#error_explanation') }
    end

    context 'with valid information' do
      let(:new_name) { 'New Name' }
      let(:new_email) { 'new@example.com' }
      before do
        fill_in 'Name',             with: new_name
        fill_in 'Email',            with: new_email
        fill_in 'Password',         with: user.password
        fill_in 'Confirm Password', with: user.password
        click_button 'Save changes'
      end

      it { should have_selector('div.alert-box.success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end
