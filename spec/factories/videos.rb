# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    name "MyString"
    content_type "MyString"
    size 1
    data ""
    description "MyString"
  end
end
