class RelationshipsController < ApplicationController
#   before_action :set_user
def create
     @user = User.find(params[:follow_id])
   following = current_user.follow(@user)
   if following.save
     flash[:success] = 'ユーザーをフォローしました'
     redirect_to request.referer
   else
     flash.now[:alert] = 'ユーザーのフォローに失敗しました'
     redirect_to request.referer
   end
end
def destroy
   @user = User.find(params[:follow_id])
   following = current_user.unfollow(@user)
   if following.destroy
     flash[:success] = 'ユーザーのフォローを解除しました'
     redirect_to request.referer
   else
     flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
     redirect_to request.referer
   end
end

def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
end

  def followings
    @user = User.find(params[:id])
    # binding.pry
    @users = @user.followings
    # render 'show_following'
  end

  def followers
    @user = User.find(params[:id])
    # binding.pry
    @users = @user.followers
    # render 'show_follower'
  end

  private


  def user_params
    params.require(:user).permit(:id, :name, :email)
  end



end
