module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  case column
	  when 'Movie Title'
	  	column = 'title'
	  when 'Release Date'
	  	column = 'release_date'
	  else
	  	column = 'title'
	  end	  	
	  link_to title,{:sort => column}, :id => "#{column}_header"
	 #link_to "Link 1", booking_path, :id => "booked"
	end

	def css_class(sort_by,column)
		if sort_by == column
			'hilite'
		end
	end
end
