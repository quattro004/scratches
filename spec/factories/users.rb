FactoryGirl.define do
  factory :user do
    name 'Testy User'
    email 'testy@recipieces.com'
    password 'tester'
    password_confirmation 'tester'
    approved true
  end
end
