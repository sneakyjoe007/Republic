class EventImagesController < BaseController
  before_action :set_event_image, only: [:show, :edit, :update, :destroy]
  before_filter :user_login_required
  before_filter :admin_required

  def index
    @event_images = EventImage.all
  end

  def show
  end

  def new
    @event_image = EventImage.new
  end

  def edit
  end

  def create
    @event_image = EventImage.new(event_image_params)

    respond_to do |format|
      if @event_image.save
        format.html { redirect_to @event_image, notice: 'Event Image was successfully created.' }
        format.json { render :show, status: :created, location: @event_image }
      else
        format.html { render :new }
        format.json { render json: @event_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event_image.update(category_params)
        format.html { redirect_to @event_image, notice: 'Event Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_image }
      else
        format.html { render :edit }
        format.json { render json: @event_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event_image.destroy
    respond_to do |format|
      format.html { redirect_to event_images_url, notice: 'Event Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_image
      @event_image = EventImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_image_params
      params.require(:event_image).permit(:name, :image, :category_id)
    end
end
