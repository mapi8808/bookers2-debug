class UsersController < ApplicationController
  
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book_new = Book.new
  end

  def index
    @users = User.all
    @book_new = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user)
      frash[:notice] = "You have updated user successfully."
    else
      @users = User.find(params[:id])
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
