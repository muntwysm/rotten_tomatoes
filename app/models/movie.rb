class Movie < ActiveRecord::Base
	#default_scope order('title ASC')

	def self.get_ratings
		ratings = []
		collection = Movie.all(:select => "DISTINCT(rating)")
		collection.each do |movie|
			ratings << movie.rating
		end
		return ratings
		#Movie.all(:select => "distinct(rating)").collect { |m| m.rating }
	end
end
