FactoryGirl.define do
  factory :user do
    name 'Testy User'
    email 'testy@recipieces.com'
    password 'tester'
    password_confirmation 'tester'
    confirmed_at Time.now
  end
end
