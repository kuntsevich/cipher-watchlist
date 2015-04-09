class HomeController < ApplicationController

  def index
  end

  def search_movie
    @movies = ItunesApi.new(params[:query])
  end
end