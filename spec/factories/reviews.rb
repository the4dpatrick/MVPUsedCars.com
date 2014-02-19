include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :review do
    customer 'John Doe'
    body 'Awesome'
    car 'GTR'
    photo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'support', 'test.jpg'), 'image/jpeg') }
  end
end
