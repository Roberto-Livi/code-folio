class FollowsController < ApplicationController
    before_action :login_required
    before_action :find_user, only: [:create, :destroy]

    def create
        current_user.follow(@user)
        redirect_to user_path(@user)
    end

    def following_list
        @users = current_user.following
    end

    def followers_list
        @users = current_user.followers
    end

    def destroy
        current_user.unfollow(@user)
        redirect_to user_path(@user)
    end


    private

    def find_user
        @user = User.find(params[:user_id])
    end

end