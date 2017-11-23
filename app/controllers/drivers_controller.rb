class DriversController < ApplicationController
  def depart
  	@drivers = Driver.all.paginate(page: params[:page])

  end

  def more()

	@drivers = Driver.offset(params[:num]).limit(8)

	render :json => @drivers.to_json
  end


  def dataAnalysis
  	@foodtypeAndCount = Food.find_by_sql("select foodtype as name,count(*) as value from foods group by foodtype")
    @priceRank = Food.find_by_sql("select foodtype as name, ROUND(AVG(average_price),2) as value from foods group by foodtype order by value DESC")
    @restaurantRakn = Food.find_by_sql("select restaurant as category,star as value from foods order by star DESC limit 10")
    @topten = Food.find_by_sql("select restaurant as name,CAST((taste+environment+service)/3 as decimal(10,2)) as value from foods order by value DESC limit 10")
  end
end
