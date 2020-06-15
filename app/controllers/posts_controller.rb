class PostsController < ApplicationController

    def create
        if !params[:post][:content].empty?
            post = Post.create(:content => params[:post][:content])
            current_user.posts << post

            redirect_to user_path(current_user)
        else
            flash[:empty_post] = "Post can't be empty"
            redirect_to user_path(current_user)
        end
    end

end