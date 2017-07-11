class StaticController < ApplicationController

  def index
    @stories = Story.all
    @recipes = Recipe.all
  end

end
