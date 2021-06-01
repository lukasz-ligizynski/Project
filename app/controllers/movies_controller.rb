class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  def destroy
  end

  def create
  end

  private

  def movie_params
    params.require(:hall).permit(:title, :duration, :description, :genre, :adult_only)
  end
end
