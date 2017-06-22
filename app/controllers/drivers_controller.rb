class DriversController < ApplicationController
  def depart
  	@drivers = Driver.limit(40)
  end

  def more()

	@drivers = Driver.limit(8).offset(params[:num])

	render :json => @drivers.to_json
  end
end
