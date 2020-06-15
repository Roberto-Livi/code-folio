class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :destroy]

    def create
        if !params[:post][:content].empty?
            post = Post.create(post_params)
            current_user.posts << post

            redirect_to user_path(current_user)
        else
            flash[:empty_post] = "Post can't be empty"
            redirect_to user_path(current_user)
        end
    end

    def show
    end

    def edit
    end

    def update
        @post.update(post_params)

        if @post.save
            redirect_to user_path(current_user)
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        # flash[:notice] = "Post deleted."
        redirect_to user_path(current_user)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end