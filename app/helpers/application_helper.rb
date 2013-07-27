module ApplicationHelper
	def sortable(column, title = nil)
	  title ||= column.titleize
	  case column
	  when 'Movie Title'
	  	column = 'title'
	  when 'Release Date'
	  	column = 'release_date'
	  end	  	
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}
	end

	def css_class(sort_by,column)
		if sort_by == column
			'hilite'
		end
	end
end
