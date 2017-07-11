class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :current_ingredients, :handle_dem_checked_boxes, :handle_dem_unchecked_boxes

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_ingredients
    session[:ingredients_list] ||= []
  end

  def handle_dem_unchecked_boxes(dem_boxes)
    format_dem_boxes = current_ingredients.select do |box|
      !dem_boxes.include?(box.to_s)
    end
    session.delete(:ingredients_list)
    session[:ingredients_list] = format_dem_boxes
  end

  def handle_dem_checked_boxes(dem_boxes, collection)
    format_dem_boxes = dem_boxes[1..-1].select do |box|
      collection.include?(box.to_i)
    end
    format_dem_boxes.map { |box| box.to_i}
  end

end
