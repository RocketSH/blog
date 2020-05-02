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
      redirect_to @post, notice: "The post has been created."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, data: { confirm: "Ready to update this post?"}, notice: "This post has been update."

    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy if @post
    redirect_to root_path, notice: "This post has been delete."
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end