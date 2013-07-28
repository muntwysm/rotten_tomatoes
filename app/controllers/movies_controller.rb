class MoviesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.get_ratings
    @all_ratings = ['PG','PG-13','R','G']
    @ratings_filter = params[:commit] ? params[:ratings].keys : session[:ratings]
    if params[:commit]
      session[:ratings] = @ratings_filter
    end
    @movies = Movie.find(:all, :order=>sort_column, :conditions => {:rating => session[:ratings]})
    
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  
  def sort_column
    sort_list = ['title','release_date']
    sort_list.include?(params[:sort]) ? params[:sort] : "title"
  end
end
