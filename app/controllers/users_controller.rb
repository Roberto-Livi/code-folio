class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :title, :birth_date, :education, :skills)
    end

    def find_user
    end

end