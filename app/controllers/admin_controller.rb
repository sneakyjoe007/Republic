class AdminController < BaseController
  #before_action :authenticate_user!
  before_filter :user_login_required
  before_filter :admin_required

  layout "admin"

  def index
  	
  	@users = User.all
  	@events = Event.all.order("event_date ASC")
  end

  def categories
  	@categories = Category.all.order("name ASC")
  end


end