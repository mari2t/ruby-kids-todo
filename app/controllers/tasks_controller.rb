class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :update, :destroy]

    def index
      @task = Task.new
      show_uncompleted = Setting.last.show_uncompleted_todos 
    
      # 全てのタスクまたは完了したタスクを取得
      tasks_query = show_uncompleted ? Task.all : Task.where(completed: true)
    
      # 日付ごとにタスクをグループ化し、ページネーションを適用
      @tasks_by_date = tasks_query.group_by { |task| task.created_at.to_date }
      @paginated_tasks = Kaminari.paginate_array(@tasks_by_date.to_a).page(params[:page]).per(2)
    
      # 今日のタスクのリストを取得
      start_of_day = Date.today.beginning_of_day
      end_of_day = Date.today.end_of_day
      # タスクの取得と並び替え
      @tasks = Task.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).order(created_at: :desc)
    end
    
    
    


    def new
        @task = Task.new
        @today_tasks = Task.where(deadline: Date.today)
    end

    def create
        @task = Task.new(task_params)
      
        # 今日の日付でフィルタリング
        start_of_day = Date.today.beginning_of_day
        end_of_day = Date.today.end_of_day
      
        # 今日作成されたタスクの数をカウント
        if Task.where(created_at: start_of_day..end_of_day).count < 10
          if @task.save
            redirect_to tasks_url, notice: 'タスクが追加されました。'
          else
            render :new
          end
        else
          redirect_to tasks_url, alert: '本日のタスク数が上限に達しています。'
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

    def destroy_by_date
      date = params[:date].to_date
      Task.where('created_at >= ? AND created_at < ?', date.beginning_of_day, date.end_of_day).destroy_all
      redirect_to tasks_path, notice: '指定日付のタスクが削除されました。'
    end
    

    def complete
        @task = Task.find(params[:id])
        @task.update(completed: true, completion_date: Date.today)
    
        respond_to do |format|
          format.html { redirect_to tasks_url }
          format.js   # JavaScriptのレスポンスを扱う
        end
    end

    def past_tasks
      @show_uncompleted = Setting.last.show_uncompleted_todos
  
      tasks_query = if @show_uncompleted
                      Task.all.order(created_at: :desc)
                    else
                      Task.where(completed: true).order(created_at: :desc)
                    end
  
      # 全タスクを日付ごとにグループ化
      grouped_tasks = tasks_query.group_by { |task| task.created_at.to_date }
  
      # 配列に変換し、ページネーションを適用
      @tasks_by_date_paginated = Kaminari.paginate_array(grouped_tasks.to_a).page(params[:page]).per(2)
    end
    
  

    private
    
    def task_params
        params.require(:task).permit(:title, :content, :completed)
    end

    def set_task
        @task = Task.find(params[:id])
    end
end
