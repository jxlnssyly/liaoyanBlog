class DriversController < ApplicationController
  def depart
  	@drivers = Driver.limit(8)
  end

  def more()

	@drivers = Driver.offset(params[:num]).limit(8)

	render :json => @drivers.to_json
  end
end
