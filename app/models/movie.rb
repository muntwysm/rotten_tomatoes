class Movie < ActiveRecord::Base
	#default_scope order('title ASC')

	def self.get_ratings
		Movie.all(:select => "distinct(rating)").collect { |m| m.rating }
	end
end
