class FunctionsController < ApplicationController
  before_action :get_movie
  before_action :set_function, only: %i[ show edit update destroy ]

  # GET /functions or /functions.json
  def index
    @functions = @movie.functions
  end

  # GET /functions/1 or /functions/1.json
  def show
  end

  # GET /functions/new
  def new
    @function = @movie.functions.build
  end

  # GET /functions/1/edit
  def edit
  end

  # POST /functions or /functions.json
  def create
    @function = @movie.functions.build(function_params)

    respond_to do |format|
      if @function.save
        format.html { redirect_to movie_functions_path(@movie), notice: "Function was successfully created." }
        format.json { render :show, status: :created, location: @function }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /functions/1 or /functions/1.json
  def update
    respond_to do |format|
      if @function.update(function_params)
        format.html { redirect_to movie_function_path(@movie), notice: "Function was successfully updated." }
        format.json { render :show, status: :ok, location: @function }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functions/1 or /functions/1.json
  def destroy
    @function.destroy
    respond_to do |format|
      format.html { redirect_to movie_functions_path(@movie), notice: "Function was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = @movie.functions.find(params[:id])
    end

    def get_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Only allow a list of trusted parameters through.
    def function_params
      params.require(:function).permit(:schedule, :room, :movie_id)
    end
end
