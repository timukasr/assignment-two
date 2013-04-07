class CommentsController < ApplicationController
	http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy

	def create
		@post = Post.find(params[:post_id])
		if !@post.closed
			@comment = @post.comments.create(params[:comment])
			UserMailer.new_comment_email(@comment).deliver
		end
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	def destroy_all
		@post = Post.find(params[:post_id])
		@post.comments.destroy_all
		redirect_to post_path(@post)
	end

end
