# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    name "MyAlbum"
    description "This is my first album."
    user_id ""
  end
end
