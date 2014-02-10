FactoryGirl.define do
  factory :message do
    name "John Doe"
    email "me@example.com"
    phone "9999999"
    subject "hello"
    body "body"
  end

  factory :user do
    name 'Bob'
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end
