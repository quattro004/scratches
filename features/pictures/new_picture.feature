Feature: New Picture
  As a family member
  I want to add pictures to the site
  So that I can share with other family members and have a place to store my pictures

    Scenario: User adds a picture
      Given I have filled in all required fields
      When I choose Create Picture
      Then I should see "Picture was successfully created."
