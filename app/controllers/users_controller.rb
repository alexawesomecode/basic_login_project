class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def show

    current_user
  end

  def update
    @user = User.find(params[:id])
	if  @user.update_attributes(user_params)
		render :new

else

render 'edit'
end

    # if @user.update
    #   redirect_to new_user_path
    # end
  end

  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def user_params
  params.require(:user).permit(:username, :email, :password)
  end

end
