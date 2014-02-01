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

      it "is the main nav" do
        expect(page).to have_selector("#main-nav")
        expect(page).to_not have_selector("#car-nav")
      end
    end

    describe "Footer" do

      describe "Contact Form" do
        it { should have_selector('h7', text: 'Contact Us') }

        describe "send a message" do
          before(:each) { ActionMailer::Base.deliveries.clear }
          after(:each) { ActionMailer::Base.deliveries.clear }

          context "when a valid message" do
            it "sends an email" do
              post contact_create_path, message: attributes_for(:message)
              expect(ActionMailer::Base.deliveries.last.to).to eq(["#{ENV["MVP_USERNAME"]}"])
            end
          end

          context "when fields are not filled" do
            it "does not send an email" do
              post contact_create_path, message: attributes_for(:message, name: '', body: '')
              expect(ActionMailer::Base.deliveries).to be_empty
            end
          end

          context "when honeypot is filled" do
            it "does not send an email" do
              post contact_create_path, message: attributes_for(:message, sweet_honey: 'bot')
              expect(ActionMailer::Base.deliveries).to be_empty
            end
          end
        end
      end

      describe "About Us" do
        it { should have_selector('h7', text: 'About Us') }
      end

      describe "More Links" do
        it { should have_selector('h7', text: 'More Links') }
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
    before { visit root_path }
    it_should_behave_like "all static pages", :root_path
    it { should have_text('Quality Cars') }
    it { should have_title('Misawa Used Cars - Misawa Auto Sales') }

    describe "Send a message" do
      before do
        fill_in "Name",  with: 'name'
        fill_in "Email", with: 'email@example.com'
        fill_in "Phone", with: '999-9999-9999'
        fill_in "Body",  with: 'Hello'
        click_button "Send"
      end

      describe "after the message is sent" do

        it "should render the desired page with a flash" do
          expect(page).to have_text('Quality Cars')
          expect(page).to have_title('Misawa Used Cars - Misawa Auto Sales')
          expect(page).to have_selector('.alert-box.success')
        end
      end
    end
  end

  describe "FAQ page" do
    before { visit faq_path }
    it_should_behave_like "all static pages", :faq_path
    it { should have_title('Frequently Asked Questions') }
    it { should have_selector('h1', text: 'Frequently Asked Questions') }

    describe "Send a message" do
      before do
        fill_in "Name",  with: 'name'
        fill_in "Email", with: 'email@example.com'
        fill_in "Phone", with: '999-9999-9999'
        fill_in "Body",  with: 'Hello'
        click_button "Send"
      end

      describe "after the message is sent" do

        it "should render the desired page with a flash" do
          expect(page).to have_selector('h1', text: 'Frequently Asked Questions')
          expect(page).to have_title('Frequently Asked Questions')
          expect(page).to have_selector('.alert-box.success')
        end
      end
    end
  end

  describe "About Us page" do
    before { visit about_path }
    it_should_behave_like "all static pages", :about_path
    it { should have_title('About Us') }
    it { should have_selector('h1', text: 'About Us') }

    describe "Send a message" do
      before do
        fill_in "Name",  with: 'name'
        fill_in "Email", with: 'email@example.com'
        fill_in "Phone", with: '999-9999-9999'
        fill_in "Body",  with: 'Hello'
        click_button "Send"
      end

      describe "after the message is sent" do

        it "should render the desired page with a flash" do
          expect(page).to have_selector('h1', text: 'About Us')
          expect(page).to have_title('About Us')
          expect(page).to have_selector('.alert-box.success')
        end
      end
    end
  end

  describe "Location page" do
    before { visit location_path }
    it_should_behave_like "all static pages", :location_path
    it { should have_title('Our Location') }
    it { should have_selector('h1', text: 'Our Location') }

    describe "Send a message" do
      before do
        fill_in "Name",  with: 'name'
        fill_in "Email", with: 'email@example.com'
        fill_in "Phone", with: '999-9999-9999'
        fill_in "Body",  with: 'Hello'
        click_button "Send"
      end

      describe "after the message is sent" do

        it "should render the desired page with a flash" do
          expect(page).to have_selector('h1', text: 'Our Location')
          expect(page).to have_title('Our Location')
          expect(page).to have_selector('.alert-box.success')
        end
      end
    end
  end

  describe "Contact Us page" do
    before { visit contact_path }
    it_should_behave_like "all static pages", :contact_path
    it { should have_title('Contact Us') }
    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_field("Subject") }

    describe "Send a message" do

      context "with main form" do
        before do
          within '#email-form' do
            fill_in "Name",  with: 'name'
            fill_in "Email", with: 'email@example.com'
            fill_in "Phone", with: '999-9999-9999'
            fill_in "Body",  with: 'Hello'
            click_button "Send"
          end
        end

        describe "after the message is sent" do

          it "should render the desired page with a flash" do
            expect(page).to have_selector('h1', text: 'Contact Us')
            expect(page).to have_title('Contact Us')
            expect(page).to have_selector('.alert-box.success')
          end
        end
      end

      context "with footer form" do
        before do
          within 'footer' do
            fill_in "Name",  with: 'name'
            fill_in "Email", with: 'email@example.com'
            fill_in "Phone", with: '999-9999-9999'
            fill_in "Body",  with: 'Hello'
            click_button "Send"
          end
        end

        describe "after the message is sent" do

          it "should render the desired page with a flash" do
            expect(page).to have_selector('h1', text: 'Contact Us')
            expect(page).to have_title('Contact Us')
            expect(page).to have_selector('.alert-box.success')
          end
        end
      end
    end
  end
end
