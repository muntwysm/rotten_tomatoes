class Movie < ActiveRecord::Base

	def self.get_ratings
		ratings = {}
		collection = Movie.all(:select => "DISTINCT(rating)")
		collection.each do |movie|
			ratings[movie.rating] = 1
		end
		return ratings
		#Movie.all(:select => "distinct(rating)").collect { |m| m.rating }
	end
end
