class WelcomeController < ApplicationController

    def home
        if current_user
            redirect_to users_path
        end
    end

end