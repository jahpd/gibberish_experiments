class LibsController < ApplicationController
  before_action :set_lib, only: [:show, :edit, :update, :destroy]

  # GET /libs
  # GET /libs.json
  def index
    @libs = Lib.all
  end

  # GET /libs/1
  # GET /libs/1.json
  def show
  end

  # GET /libs/new
  def new
    @lib = Lib.new
  end

  # GET /libs/1/edit
  def edit
  end

  # POST /libs
  # POST /libs.json
  def create
    @lib = Lib.new(lib_params)

    respond_to do |format|
      if @lib.save
        format.html { redirect_to @lib, notice: 'Lib was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lib }
      else
        format.html { render action: 'new' }
        format.json { render json: @lib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libs/1
  # PATCH/PUT /libs/1.json
  def update
    respond_to do |format|
      if @lib.update(lib_params)
        format.html { redirect_to @lib, notice: 'Lib was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libs/1
  # DELETE /libs/1.json
  def destroy
    @lib.destroy
    respond_to do |format|
      format.html { redirect_to libs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lib
      @lib = Lib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lib_params
      params.require(:lib).permit(:name, :author, :code, :created_at)
    end
end
