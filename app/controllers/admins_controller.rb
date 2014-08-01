class AdminsController < BaseController
  #before_action :authenticate_user!
  before_filter :user_login_required
  before_filter :admin_required

  layout "admin"

  def index
  	
  	@users = User.all
  	@events = Event.all.order("event_date ASC")
  end

  def categories
    @category = Category.all.order("name ASC")
  end

  def show
    
  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(admin_params)
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def admin_params
     params.require(:category).permit(:name)
  end

end