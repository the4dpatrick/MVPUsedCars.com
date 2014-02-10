require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "sign in page" do
    before { visit signin_path }

    it { should have_content 'Sign in' }
    it { should have_title 'Sign in' }
  end

  describe "sign in" do

    before { visit signin_path }

    context "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title("Sign in") }
      it { should have_selector("div.alert.alert-box") }

      describe "after visiting another page" do
        before { click_link "Inventory" }
        it { should_not have_selector("div.alert.alert-box") }
      end
    end

    context "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
      end
    end
  end
end
