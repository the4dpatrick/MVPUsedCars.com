require 'spec_helper'

describe "Pages" do

  subject { page }

  shared_examples_for "all static pages" do |path_name|
    before { visit send(path_name) }

    describe "Navigation" do
      it { should have_css("img[src*='simple-logo.png']") }
      it { should have_selector(".top-bar") }
      it { should have_link('Home') }
      it { should have_link('Inventory') }
      it { should have_link('FAQ') }
      it { should have_link('About Us') }
      it { should have_link('Location') }
      it { should have_link('Contact Us') }
    end

    describe "Footer" do

      describe "Contact Form" do
        it { should have_selector('h4', text: 'Contact Us') }

        context "when a valid message" do

          it "sends an email" do
            post contact_create_path, message: attributes_for(:message)
            expect(ActionMailer::Base.deliveries.last.to).to eq(["#{ENV["MVP_USERNAME"]}"])
            ActionMailer::Base.deliveries.clear
          end
        end

        context "when fields are not filled" do
          it "does not send an email" do
            post contact_create_path, message: attributes_for(:message, name: '', body: '')
            expect(ActionMailer::Base.deliveries).to be_empty
            ActionMailer::Base.deliveries.clear
          end
        end

        context "when honeypot is filled" do
          it "does not send an email" do
            post contact_create_path, message: attributes_for(:message, sweet_honey: 'bot')
            expect(ActionMailer::Base.deliveries).to be_empty
          end
        end
      end

      describe "About Us" do
        it { should have_selector('h4', text: 'About Us') }
      end

      describe "More Links" do
        it { should have_selector('h4', text: 'More Links') }
      end
      it "has social buttons for large up screens" do
        expect(page).to have_selector('#social.show-for-large-up>ul')
      end
      it "has social buttons for medium down screens" do
        expect(page).to have_selector('#social.hide-for-large-up>ul')
      end
    end
  end

  describe "Home page" do
    it_should_behave_like "all static pages", :root_path
  end

  describe "FAQ page" do
    it_should_behave_like "all static pages", :faq_path
  end

  describe "About Us page" do
    it_should_behave_like "all static pages", :about_path
  end

  describe "Location page" do
    it_should_behave_like "all static pages", :location_path
  end

  describe "Contact Us page" do
    it_should_behave_like "all static pages", :contact_path
  end

end
