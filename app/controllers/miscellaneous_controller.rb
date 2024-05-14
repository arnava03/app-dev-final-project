class MiscellaneousController < ApplicationController
  def home
    render({ :template => "miscellaneous/home" })
  end 
end
