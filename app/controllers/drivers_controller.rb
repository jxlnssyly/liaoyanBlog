class DriversController < ApplicationController
  def depart
  end

  def more
  	respond_to do |format|
	  
	  format.js
	end
  end
end
