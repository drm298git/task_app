class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュールを新規作成しました"
      redirect_to :posts
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id]) 
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "スケージュールの編集を完了しました"
      redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end



  private 
  def post_params
    params.require(:post).permit(:title, :start_at, :end_at, :all_day, :memo)
  end

end