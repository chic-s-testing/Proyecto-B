class FunctionsController < ApplicationController
  before_action :set_function, only: %i[ show edit update destroy ]

  # GET /functions or /functions.json
  def index
    @functions = Function.all
  end

  # GET /functions/1 or /functions/1.json
  def show
  end

  # GET /functions/new
  def new
    @function = Function.new
  end

  # GET /functions/1/edit
  def edit
  end

  # POST /functions or /functions.json
  def create
    @function = Function.new(function_params)

    respond_to do |format|
      if @function.save
        format.html { redirect_to @function, notice: "Function was successfully created." }
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
        format.html { redirect_to @function, notice: "Function was successfully updated." }
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
      format.html { redirect_to functions_url, notice: "Function was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function
      @function = Function.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def function_params
      params.require(:function).permit(:schedule, :room, :movie_id)
    end
end
