require "spec_helper"

describe ContactMailer do
  describe '#new_message' do

    let(:message) { mock_model Message, attributes_for(:message) }
    let(:mail) { ContactMailer.new_message(message) }

    it 'renders the subject' do
      expect(mail.subject).to match("#{message.subject}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(["#{ENV["MVP_USERNAME"]}"])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(["no-reply@mvpusedcars.com"])
    end

    it 'assigns @messages attributes' do
      expect(mail.body.encoded).to match(message.name)
      expect(mail.body.encoded).to match(message.email)
      expect(mail.body.encoded).to match(message.subject)
      expect(mail.body.encoded).to match(message.phone)
      expect(mail.body.encoded).to match(message.body)
    end

  end
end
