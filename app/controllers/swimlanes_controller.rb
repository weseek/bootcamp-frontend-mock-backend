class SwimlanesController < ApplicationController
  before_action :set_swimlane, only: %i[ update destroy ]

  # GET /swimlanes
  # GET /swimlanes.json
  def index
    @swimlanes = Swimlane.all
  end

  # GET /swimlanes/1
  # GET /swimlanes/1.json
  def show
    @swimlane = Swimlane.preload(:tasks).find(params[:id])
  end

  # POST /swimlanes
  # POST /swimlanes.json
  def create
    @swimlane = Swimlane.new(swimlane_params)

    unless @swimlane.save
      render json: {errors: @swimlane.errors}, status: :unprocessable_entity
      return
    end
    render :show, status: :created
  end

  # PATCH/PUT /swimlanes/1
  # PATCH/PUT /swimlanes/1.json
  def update
    unless @swimlane.update(swimlane_params)
      render json: {errors: @swimlane.errors}, status: :unprocessable_entity
      return
    end
    render :show
  end

  # DELETE /swimlanes/1
  # DELETE /swimlanes/1.json
  def destroy
    unless @swimlane.destroy
      render json: {errors: @swimlane.errors}, status: :unprocessable_entity
      return
    end
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimlane
      @swimlane = Swimlane.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def swimlane_params
      params.except(:format, :swimlane, :id).permit(:name, :description, :sprint_id)
    end
end
