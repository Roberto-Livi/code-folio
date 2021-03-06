class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]
    before_action :login_required, only: [:show, :edit, :index]

    def index
        @user = User.find_by(id: session[:user_id])
        @searched_user = User.search(params[:search])
        @posts = Post.all

        @longest_post = Post.longest_post.first
        @user_longest_post = User.find(@longest_post.user_id).username
    end

    def new
        if current_user
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:sign_up_error] = "Cant leave Username or Password fields empty"
            redirect_to new_user_path
        end
    end

    def show
    end

    def edit
        if current_user != @user
            redirect_to users_path
        end
    end

    def update
        @user.update(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        session.clear if session[:user_id]
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation,:title, :birth_date, :education, :skills, :search, :profile_pic, :gender, :uid)
    end

    def find_user
        @user = User.find(params[:id])
    end

end