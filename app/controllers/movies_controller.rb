# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    movies = Movies::Repository.new.find_all
    render json: Movies::Representer.new(movies).basic
  end

  def show
    movie = Movies::Repository.new.find_by(params[:id])
    render json: Movies::Representer.new([movie]).extended
  end

  def update
    movie = Movies::UseCases::Update.new.call(id: params[:id], params: movie_params)
    if movie.valid?
      render json: movie
    else
      render json: movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Movies::UseCases::Delete.new.call(id: params[:id])
    render json: { status: 'deleted' }
  end

  def create
    @movie = Movies::UseCases::Create.new.call(params: movie_params)

    if @movie.valid?
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :duration, :description, :genre, :adult_only)
  end
end
