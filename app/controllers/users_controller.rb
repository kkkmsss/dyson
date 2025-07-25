class UsersController < ApplicationController

    def show

        @user = User.find(params[:id]) 
        @clean = Clean.all
    end

    def iine
        
        @user = User.find(params[:id]) 
        @cleans = Clean.all
    end
end
