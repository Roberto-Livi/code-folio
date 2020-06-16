class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            post = Post.find(@comment.post_id)
            redirect_to user_post_path(post.user_id, @comment.post_id)
        else
            redirect_to user_path(current_user)
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment_id = comment.post_id
        post = Post.find(comment.post_id)
        comment.destroy

        redirect_to user_post_path(post.user_id, comment_id)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end

end