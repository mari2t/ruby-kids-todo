class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :update, :destroy]

    def index
        @tasks = Task.all
        @task = Task.new  
    end

    def new
        @task = Task.new
        @today_tasks = Task.where(deadline: Date.today)
    end

    def create
        @task = Task.new(task_params)
        @task.deadline = Date.today  # 現在の日付をdeadlineに設定

        if @task.save
            redirect_to tasks_path
        else 
            render :new
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to tasks_path
        else 
            render :edit
        end
    end

    def destroy
        @task.destroy
        redirect_to tasks_path
    end

    def complete
        @task = Task.find(params[:id])
        @task.update(completed: true)
    
        respond_to do |format|
          format.html { redirect_to tasks_url }
          format.js   # JavaScriptのレスポンスを扱う
        end
    end

    private
    
    def task_params
        params.require(:task).permit(:title, :content, :completed)
    end

    def set_task
        @task = Task.find(params[:id])
    end
end
