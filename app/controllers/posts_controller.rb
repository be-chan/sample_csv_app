class PostsController < ApplicationController

  def index
    @post = Post.new

    # 検索用
    if params[:search].present? 
      @posts = Post.where("title LIKE ?", "%#{params[:search]}%")
    end
    if params[:date_search].present?
      @posts = Post.where("contract = ?", params[:date_search])
    end
    p @posts
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_index_path
    else
      render posts_index_path
    end
  end

  private
  def posts_params
    params.require(:post).permit(:title, :contract)
  end
end
