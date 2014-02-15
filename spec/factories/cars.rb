FactoryGirl.define do
  factory :car do
    make 'Toyota'
    model 'Altezza'
    year '2000'
    seats '4'
    transmission 'A/T'
    drive '4WD'
    interior 'Black'
    exterior 'Silver'
  end
end
