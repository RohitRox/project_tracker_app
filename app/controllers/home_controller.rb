class HomeController < ActionController::Base
  
  layout 'main'
  before_filter :authenticate_user!
  
  def index
  
  respond_to do |format|
  format.html
  end
  end
end
