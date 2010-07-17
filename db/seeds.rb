# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Category.create([
  { :name => 'Marinades, Rubs, Sauces', :description => 'The best recipes for marinades, rubs and sauces.'},
  { :name => 'Chicken', :description => 'Meals containing chicken as the main ingredient.'},
  { :name => 'Beef', :description => 'Meals containing beef as the main ingredient.'},
  { :name => 'Pork', :description => 'Meals containing pork as the main ingredient.'},
  { :name => 'Turkey', :description => 'Meals containing turkey as the main ingredient.'},
  { :name => 'Salads', :description => 'Nutritious and delicious!'},
  { :name => 'Grilling', :description => 'Grillin and chillin!'},
  { :name => 'Drinks', :description => 'Thirsty anyone?'}
])
