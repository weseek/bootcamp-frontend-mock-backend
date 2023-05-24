class SwimlanesController < ApplicationController
  before_action :set_swimlane, only: %i[ show update destroy ]

  # GET /swimlanes
  # GET /swimlanes.json
  def index
    @swimlanes = Swimlane.all
  end

  # GET /swimlanes/1
  # GET /swimlanes/1.json
  def show
  end

  # POST /swimlanes
  # POST /swimlanes.json
  def create
    @swimlane = Swimlane.new(swimlane_params)

    if @swimlane.save
      render :show, status: :created, location: @swimlane
    else
      render json: @swimlane.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /swimlanes/1
  # PATCH/PUT /swimlanes/1.json
  def update
    if @swimlane.update(swimlane_params)
      render :show, status: :ok, location: @swimlane
    else
      render json: @swimlane.errors, status: :unprocessable_entity
    end
  end

  # DELETE /swimlanes/1
  # DELETE /swimlanes/1.json
  def destroy
    @swimlane.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimlane
      @swimlane = Swimlane.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def swimlane_params
      params.fetch(:swimlane, {})
    end
end
