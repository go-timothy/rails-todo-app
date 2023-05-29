class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def show
        @task = Task.find(params[:id])
      end

    def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to action: "index"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to action: "index"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @task = Task.find(params[:id])

        if @task.destroy()
            redirect_to action: "index"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def task_params
      params.require(:task).permit(:title, :detail)
    end
end
