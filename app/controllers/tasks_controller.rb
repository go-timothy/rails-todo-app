class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
      end

    def create
        @task = Task.new(task_params)

        if @task.save
            render :json => { :status => "success", :data => @task }
        else
            render :json => { :status => "error", :data => @task.errors.full_messages }
        end
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            render :json => { :status => "success", :data => @task }
        else
            render :json => { :status => "error", :data => @task.errors.full_messages }
        end
    end

    def destroy
        @task = Task.find(params[:id])

        if @task.destroy()
            render :json => { :status => "success" }
        else
            render :json => { :status => "error", :data => @task.errors.full_messages }
        end
    end

    private
    def task_params
      params.require(:task).permit(:title, :detail)
    end
end
