class TasksController < ApplicationController
    def index
        user_id = 1
        @tasks = Task.where(user_id: user_id)
        return @tasks
    end

    def show
        @task = Task.find(params[:id])
      end

    def create
        @task = Task.new(task_params)
        @task.user_id = 1

        if @task.save
            render :json => { :status => "success", :data => @task }
        else
            render :json => { :status => "error", :data => @task.errors.full_messages }
        end
    end

    def update
        @task = Task.find(params[:id])
        @task.user_id = 1

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
