class MoviesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @movies = Movie.all()
    end

    def show
        # in movie model find id
        @movie = Movie.find(params[:id])
    end

    def create
        new_movie = Movie.create(title: params[:title], duration: params[:duration].to_i)
        render json: new_movie

        redirect_to movies_path
    end

    def update
        updated_movie = Movie.update(params[:id], title: params[:title], duration: params[:duration].to_i)
    end

    def destroy
        destroyed_movie = Movie.find(params[:id]).destroy
        render json: destroyed_movie
    end

    def new
    end
end