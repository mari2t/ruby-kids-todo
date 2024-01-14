class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]


  def new
    @comment = Comment.new(date: params[:date])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to tasks_path(date: @comment.date), notice: 'コメントを追加しました。'
    else
      render :new
    end
  end


  def update
    if @comment.update(comment_params)
      redirect_to tasks_path(date: @comment.date), notice: 'コメントを更新しました。'
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
    @comment = Comment.find_by(date: params[:date])
  end

  def comment_params
    params.require(:comment).permit(:comment, :date)
  end
end
