class AdminController < BaseController
  #before_action :authenticate_user!
  before_filter :user_login_required
  before_filter :admin_required

  layout "admin"

  def index
  	
  	@users = User.all
  	@events = Event.all
  end

end