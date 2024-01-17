class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]


  def new
    @comment = Comment.new(date: params[:date])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to past_tasks_tasks_path,notice: 'コメントを更新しました'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      redirect_to past_tasks_tasks_path
    else
      render :edit
    end
  end


  def destroy
    date = @comment.date
    @comment.destroy
    redirect_to tasks_path(date: date), notice: 'コメントを削除しました。'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :date)
  end
end
