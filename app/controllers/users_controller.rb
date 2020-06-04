class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @pendings = current_user.pending_friends
    @requests = current_user.friend_requests
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent

    @pendings = current_user.pending_friends
    @requests = current_user.friend_requests
    @friends = current_user.friends
  end
end
