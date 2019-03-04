class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def show
    find_post
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save && @post.valid?
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    find_post
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
  end

  def find_post
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :summary, :category)
  end

end
