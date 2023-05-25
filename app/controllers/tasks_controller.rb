class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    unless @task.save
      render json: {errors: @task.errors}, status: :unprocessable_entity
      return
    end
    render :show, status: :created
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    unless @task.update(task_params)
      render json: {errors: @task.errors}, status: :unprocessable_entity
      return
    end
    render :show
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    unless @task.destroy
      render json: {errors: @task.errors}, status: :unprocessable_entity
      return
    end
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.except(:format, :task, :id).permit(:description, :name, :status, :assignee_id, :swimlane_id)
    end
end
