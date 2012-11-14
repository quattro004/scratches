Given /^I have filled in all required fields$/ do
  create_visitor
  sign_in
  visit new_picture_path
  fill_in 'Name', :with => 'SweetPic.png'
  fill_in 'Description', :with => 'This is the best pic ever!'
end

When /^I choose Create Picture$/ do
  click_button 'Create Picture'
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content(message)
end
