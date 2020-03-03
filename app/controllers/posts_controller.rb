class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_post, only: [:show, :edit]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    tag_list = tag_params[:tag_name].split(/[[:blank:]]+/).select(&:present?)
    if post.save
      post.save_tags(tag_list)
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def edit
    @tag_list = @post.tags.pluck(:tag_name)
  end

  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(9)
  end

  def update
    post = Post.find(params[:id])
    tag_list = tag_params[:tag_name].split(/[[:blank:]]+/).select(&:present?)
    if post.update(post_params)
      post.save_tags(tag_list)
      redirect_to action: :show
    else
      redirect_to action: :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :content).merge(user_id: current_user.id)
  end

  def tag_params
    params.require(:post).permit(:tag_name)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
