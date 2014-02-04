# include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :car do
    make "MyString"
    model "MyString"
    year 1
    seats 1
    transmission "MyString"
    drive "MyString"
    interior "MyString"
    exterior "MyString"
    # uploads { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg')) }
  end
end
