module ArticlesHelper

	def monthToEnglisg(month)
		monthArr = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
		return monthArr[month+1]
	end
end
