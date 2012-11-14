require 'spec_helper'

describe Album do

  before(:each) do
    @attr = {
      :name => 'My first album',
      :description => 'This is the best album ever!',
      :user_id => -1
    }
  end

  it "should create a new instance given a valid attribute" do
    Album.create!(@attr)
  end

  describe "attributes" do

    before(:each) do
      @album = Album.create!(@attr)
    end

    it "should have a name attribute" do
      @album.should respond_to(:name)
    end

    it "should have a description attribute" do
      @album.should respond_to(:description)
    end

    it "should have a user_id attribute" do
      @album.should respond_to(:user_id)
    end

  end
end
