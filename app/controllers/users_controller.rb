class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
       @user = User.new(user_params)
       if @user.save
          flash[:success] = "welcome to the alpha blog #{@user.username}" 
          redirect_to @user
       else
          render 'new'
       end
    end
    
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
    
    def edit
        @user = User.find(params[:id])    
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update
            flash[:success] = "Your account was update successfully"
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
end