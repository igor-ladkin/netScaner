FactoryGirl.define do
  factory :switch do   
    ip_address '192.168.1.249'
    mac_address { Faker::Internet.mac_address }
    type 'switch'
  end
end
