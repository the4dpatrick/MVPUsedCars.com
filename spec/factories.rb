FactoryGirl.define do
  factory :message do
    name "John Doe"
    email "me@example.com"
    phone "9999999"
    subject "hello"
    body "body"
  end

  # factory :upload do |u|
  #   u.upload { fixture_file_upload(File.join(Rails.root, 'spec', 'photos', 'test.jpg'), 'image/jpg') }
  # end
end
