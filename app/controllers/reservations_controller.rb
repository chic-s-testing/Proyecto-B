class ReservationsController < ApplicationController
  before_action :get_function
  before_action :get_movie
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    @reservations = @function.reservations
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = @function.reservations.build
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    puts "********************************"
    puts reservation_params
    puts params[:seats]
    reservations = []
    params[:seats].each do |seat_value|
      reservations.push({'seat' => seat_value, 'day' => reservation_params[:day], 'function_id' => params[:function_id]})
    end
    puts "valores recibidos"
    puts reservations
    @reservations = @function.reservations.create(reservations)
    success = true
    @reservations.each do |r| 
      success = success && r.save
    end
    respond_to do |format|
      if success
        format.html { redirect_to movie_function_path(@movie, @function), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to movie_function_reservation_path(@function), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to movie_function_reservations_path(@function), notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = @function.reservations.find(params[:id])
    end

    def get_function
      @function = Function.find(params[:function_id])
    end

    def get_movie
      @movie = @function.movie
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:day)
    end
end
