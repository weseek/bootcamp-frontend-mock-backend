class SprintsController < ApplicationController
  before_action :set_sprint, only: %i[ update destroy ]

  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.all.preload(:swimlanes)
    case params[:status]
    when 'archived'
      @sprints = @sprints.where(is_archived: true)
    end
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
    @sprint = Sprint.preload(swimlanes: :tasks).find(params[:id])
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
    unless @sprint.destroy
      render json: {errors: @sprint.errors}, status: :unprocessable_entity
      return
    end
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
