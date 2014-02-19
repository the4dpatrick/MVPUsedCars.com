include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :upload do
    upload { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'support', 'test.jpg'), 'image/jpeg') }
    association :car
  end
end
