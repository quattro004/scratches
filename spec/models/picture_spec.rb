require 'spec_helper'

describe Picture do

  before(:each) do
    @attr = {
      :name => 'SweetPic.png',
      :content_type => 'image/png',
      :data => 004,
      :size => 3.megabyte,
      :description => 'This is the best pic ever!'
    }

  end

  it "should create a new instance given a valid attribute" do
    Picture.create!(@attr)
  end

  describe "attributes" do

    before(:each) do
      @picture = Picture.create!(@attr)
    end

    it "should have a name attribute" do
      @picture.should respond_to(:name)
    end

    it "should have a content_type attribute" do
      @picture.should respond_to(:content_type)
    end

    it "should have a data attribute" do
      @picture.should respond_to(:data)
    end

    it "should have a size attribute" do
      @picture.should respond_to(:size)
    end

    it "should have a description attribute" do
      @picture.should respond_to(:description)
    end

  end

  describe "validations" do

    it "should only accept image content types" do
      invalid_content_type = Picture.new(@attr.merge(:content_type => ""))
      invalid_content_type.should_not be_valid
    end

  end

end
