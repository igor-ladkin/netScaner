FactoryGirl.define do
  factory :workstation do
    ip_address '192.168.1.50'
    mac_address { Faker::Internet.mac_address }
  end
end
