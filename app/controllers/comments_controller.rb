class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
	 	@comment = @post.comments.create(params[:comment].permit(:name, :comment))
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end


def show
		@post = Post.find(params[:post_id])
		@comments = Comment.find(params[:id])
	end

def edit
	@post = Post.find(params[:post_id])
	@comment = Comment.find(params[:id])
	end

def update
	@post = Post.find(params[:post_id])
	@comment = Comment.find(params[:id])

	if @comment.update(comment_params)
		flash[:notice]="Comment Updated Sucessfully"
		redirect_to root_path
	else
		render 'edit'
		end
	end

	def comment_params
	  params.require(:comment).permit(:name, :comment)
	end



end
