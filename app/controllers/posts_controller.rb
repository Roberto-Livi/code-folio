class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :destroy]
    before_action :login_required, only: [:index, :edit, :update, :show, :destroy]

    def index
        if params[:user_id]
            if @user = User.find_by(id: params[:user_id])
            @posts = User.find(params[:user_id]).posts
            else
                redirect_to user_path(current_user)
            end
        else
            redirect_to user_path(current_user)
        end
    end

    def create
        if !params[:post][:content].empty? && !params[:post][:title].empty?
            post = Post.create(post_params)
            current_user.posts << post

            redirect_to user_path(current_user)
        else
            flash[:empty_post] = "Post fields can't be empty"
            redirect_to users_path(current_user)
        end
    end

    def show
        if params[:user_id]
            @user = User.find(params[:user_id])
            @post = @user.posts.find_by(id: params[:id])
            @comment = Comment.new
            if @post.nil?
                redirect_to users_path(current_user)
            end
        else
            @post = Post.find(params[:id])
        end
    end

    def edit
        if session[:user_id] != @post.user_id
            redirect_to user_path(current_user)
        else
            render :edit
        end
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