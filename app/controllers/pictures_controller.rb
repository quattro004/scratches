require 'RMagick'
include Magick

# Responsible for manipulating pictures for a recipe.
class PicturesController < ApplicationController
  respond_to :html, :xml, :json

  def show
    @picture = Picture.find(params[:id])
    send_data(@picture.data,
      :filename => @picture.name,
      :type => @picture.content_type,
      :disposition => "inline" )
  end
  
  def thumbnail
    @picture = Picture.find(params[:id])
    @image = Image.from_blob(@picture.data).first
    
    send_data(@image.thumbnail(60, 60).to_blob,
      :filename => @picture.name,
      :type => @picture.content_type,
      :disposition => "inline" )
  end
end
