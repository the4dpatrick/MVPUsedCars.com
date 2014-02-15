FactoryGirl.define do
  factory :message do
    name 'John Doe'
    email 'me@example.com'
    phone '9999999'
    subject 'hello'
    body 'body'
  end

  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password 'foobar'
    password_confirmation 'foobar'

    factory :admin do
      admin true
    end
  end

end
