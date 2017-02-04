class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # do we need this?
  # def index
  #   @comments = Comment.all
  # end

  def show
  end

  def new
    if current_user
      @comment = Comment.new
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def edit
    if current_user
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if current_user
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      end
    else
      redirect_to root_path, notice: 'You have to be logged it to do that!!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :content, :pin_id)
    end
end
