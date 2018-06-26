class PostsController < ApplicationController
	before_action :current_user, only: [:edit, :update, :destroy]
	def new
	  @post = Post.new
	end

	def index
	  @posts = Post.all
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save!
			flash[:notice] = "Post Successfully Created"
			redirect_to "/"
		else
			render "/posts/new"
			flash[:notice] = "Post failed"
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

	  if @post.update(params[:post].permit(:title, :content))
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @post = Post.find(params[:id])
	  @post.destroy

	  redirect_to posts_path
	end




	private
	 def post_params
	  params.require(:post).permit(:title, :content)
	 end
	end
