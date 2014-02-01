# Read about factories at https://github.com/thoughtbot/factory_girl

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
  end
end
