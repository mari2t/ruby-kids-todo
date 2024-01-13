class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :update, :destroy]

    def index
      @task = Task.new  
      show_uncompleted = Setting.last.show_uncompleted_todos 
    
      if show_uncompleted
          @tasks_by_date = Task.all.group_by { |task| task.created_at.to_date }
      else
          @tasks_by_date = Task.where(completed: true).group_by { |task| task.created_at.to_date }
      end
    
      # 今日の日付でフィルタリングされたタスクのリストを@tasks変数に割り当てる
      start_of_day = Date.today.beginning_of_day
      end_of_day = Date.today.end_of_day
      @tasks = Task.where(created_at: start_of_day..end_of_day)
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

  if @show_uncompleted
    # 未完了のタスクも含む全てのタスクを取得
    @tasks_by_date = Task.where("created_at <= ?", Date.tomorrow).group_by { |task| task.created_at.to_date }
  else
    # 完了したタスクのみを取得
    @tasks_by_date = Task.where("completed = ? AND created_at <= ?", true, Date.tomorrow).group_by { |task| task.created_at.to_date }
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
