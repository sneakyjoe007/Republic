class AdminController < BaseController
  #before_action :authenticate_user!
  before_filter :user_login_required
  before_filter :admin_required


  def index

  end

end