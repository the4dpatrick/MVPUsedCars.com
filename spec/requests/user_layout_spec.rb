require 'spec_helper'

describe 'User layout' do

  subject { page }

  describe 'navigation' do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }

    it { should have_css("img[src*='simple-logo.png']") }
    it { should have_selector('.top-bar') }
    it { should have_title(user.name) }
    it { should have_link(user.name) }
    it { should have_link('Settings', edit_user_path(user)) }
    it { should have_link('Sign out', href: signout_path) }
    it { should_not have_link('Sign in', href: signin_path) }
  end

  describe 'sidebar' do

    context 'as a non-admin' do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_link('Dashboard', href: dashboard_path) }
      it { should_not have_link('Cars', href: cars_path) }
      it { should_not have_link('Users', href: users_path) }
    end

    context 'as an admin' do
      let(:admin) { FactoryGirl.create(:admin) }
      before { sign_in admin }

      it { should have_link('Dashboard', href: dashboard_path) }
      it { should have_link('Cars', href: cars_path) }
      it { should have_link('Users', href: users_path) }
    end
  end

  describe 'main content' do
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
    end

    describe 'Users#index page renders' do
      before { visit users_path }
      it { should have_title('All users') }
    end

    describe 'Cars#index page renders' do
      before { visit cars_path }
      it { should have_title('All cars') }
    end
  end
end
