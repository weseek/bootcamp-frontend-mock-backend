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
      render json: @sprint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    unless @sprint.update(sprint_params)
      render json: @sprint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sprint_params
      params.except(:format, :sprint).permit(:name, :start_at, :end_at, :is_archived)
    end
end
