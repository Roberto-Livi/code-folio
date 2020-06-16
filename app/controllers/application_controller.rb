class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :login_required

    def current_user
        user = User.find_by(:id => session[:user_id])
    end

    def login_required
        unless session[:user_id]
            redirect_to root_url
        end
    end

end
