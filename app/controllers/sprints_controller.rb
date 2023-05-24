class SprintsController < ApplicationController
  before_action :set_sprint, only: %i[ show update destroy ]

  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.all
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = Sprint.new(sprint_params)

    unless @sprint.save
      render json: {errors: @sprint.errors}, status: :unprocessable_entity
      return
    end
    render :show, status: :created
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    unless @sprint.update(sprint_params)
      render json: {errors: @sprint.errors}, status: :unprocessable_entity
      return
    end
    render :show
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint.destroy
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sprint_params
      params.except(:format, :sprint, :id).permit(:name, :start_at, :end_at, :is_archived)
    end
end
