class DriversController < ApplicationController
  def depart
  	@drivers = Driver.all.paginate(page: params[:page])

  end

  def more()

	@drivers = Driver.offset(params[:num]).limit(8)

	render :json => @drivers.to_json
  end
end
