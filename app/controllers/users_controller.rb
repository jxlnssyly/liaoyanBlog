class UsersController < ApplicationController
    before_action :show_current_user, only: [:show]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash.now[:success] = "注册成功!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end
  private
	  def user_params
	    params.require(:user).permit(:name, :email, :password,:password_confirmation)
	  end

    def show_current_user
      user = User.find(params[:id])
      if current_user.nil?
        flash[:error] = "请先登录";
        redirect_to signin_path
      else
        redirect_to user_path(current_user), notice: "不能查看其他人的信息." unless current_user?(user)
      end

    end

end
