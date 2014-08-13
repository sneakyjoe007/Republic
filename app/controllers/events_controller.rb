class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index  

    @categories = Category.all.order("name ASC")

    if params[:search].blank? && params[:category_id].present?
      @events = Event.where("category_id = ?", params[:category_id]).order("event_date ASC")
    elsif params[:search].present? && params[:category_id].present?
      @events = Event.where("category_id = ? AND LOWER(name) LIKE LOWER(?)", params[:category_id], "%#{params[:search]}%").order("event_date ASC")
    elsif params[:search].present?
      @events = Event.where("category_id = ? OR LOWER(name) LIKE LOWER(?)", params[:category_id], "%#{params[:search]}%").order("event_date ASC")
    else
      @events = Event.all.order("event_date ASC")
    end 
  end

  # GET /events/1
  # GET /events/1.json
  def show  
    
  end


  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    

    @event.organization_id = current_organization.id
    @event.volunteers_current = 0
    @event.volunteers_percentage = 0
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update



    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :category_id, :description, :address, :event_date, :event_time, :zip_code, :city, :state, :image, :volunteers_needed, :volunteers_percentage)
    end

    def set_date_format
      @event.event_date = Date.strptime(@event.event_date.to_s, "%d/%m/%Y") unless @event.event_date.nil?
    end

end
