FactoryGirl.define do
  factory :node do
    ip_address { Faker::Internet.ip_v4_address }
    mac_address { Faker::Internet.mac_address }
  end
end
