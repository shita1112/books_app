class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @commentable.comments
  end

  def show
  end

  def new
    @comment = @commentable.comments.build
  end

  def edit
  end

  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to [@commentable, @comment], notice: t('.created')
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@commentable, @comment], notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to [@commentable, :comments], notice: t('.destroyed')
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
