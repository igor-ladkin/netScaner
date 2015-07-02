FactoryGirl.define do
  factory :printer do
    ip_address '192.168.1.100'
    mac_address { Faker::Internet.mac_address }
    type 'switch'
  end
end
