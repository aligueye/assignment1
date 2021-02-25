class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
    session[:return_to] ||= request.referer
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update

    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to session.delete(:return_to), notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST imports schedules from csv
  def import
    Schedule.import(params[:file])
    redirect_to schedules_path, notice: "Schedules imported successfully"
  end

  # GET searches for available rooms matching Hackathon requirements
  def search
    '''
    param: date - string
    param: start - string
    param: capacity - string
    param: length - string

    '''

    avail_rooms_id = []
    i = 1
    start_date_time = Time.parse(params[:date] + " " + params[:start])
    end_date_time = start_date_time + (60 * 60 * Integer(params[:length]))
    curr_date_time = start_date_time + (60 * 60)
    meal_room_cap = Integer(params[:capacity]) * 6/10
    comp_room_cap = Integer(params[:capacity]) * 1/10

    # Finds and adds conference to desired schedule id's
    conf_room = Schedule.where("cap > ? and time = ? and date = ? and avail = true", 
                               params[:capacity], 
                               params[:start], 
                               params[:date]
                               ).ids.first

    avail_rooms_id << conf_room

    while(curr_date_time != end_date_time - (60 * 60)) do
      
      curr_hour = curr_date_time.strftime('%I:%M %p')
      curr_date = curr_date_time.strftime('%F')
      
      # If i % 6, find room to eat with 60% of participants 
      if i % 6 == 0

        meal_room = Schedule.where("cap > ? and time = ? and date = ? and food = true and avail = true",
                                   meal_room_cap,
                                   curr_hour,
                                   curr_date
                                   ).ids.first

        avail_rooms_id << meal_room

      # else find room with computers to support 10% of participants
      else

        comp_room = Schedule.where("cap > ? and time = ? and date = ? and comp_avail = true and avail = true",
                                   comp_room_cap,
                                   curr_hour,
                                   curr_date
                                  ).ids.first
                                
        avail_rooms_id << comp_room
        
      end
      
      # Increments iteration, date, and time
      i += 1
      curr_date_time += (60 * 60)
    end

    # Finds and adds final room to desired schedule id's
    final_room = Schedule.where("cap > ? and time = ? and date = ?",
                                params[:capacity],
                                end_date_time.strftime('%I:00 %p'),
                                end_date_time.strftime('%F')
                                ).ids.first
                              
    avail_rooms_id << final_room

    # Checks if rooms were found and assigns them to instance variable
    if avail_rooms_id.empty? == false
      @avail_rooms = Schedule.find(avail_rooms_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:building, :number, :date, :time, :avail, :type)
    end
end
