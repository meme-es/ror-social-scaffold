class FriendshipsController < ApplicationController
  def create
    friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id], confirmed: false)
    friendship.save

    redirect_to users_url, notice: 'Friend request sent'
  end

  def confirm
    friendship1 = Friendship.new(user_id: current_user.id , friend_id:  params[:friend_id], confirmed: true)
    friendship1.save

    friendship2 = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id)
    friendship2.update(confirmed: true)


    redirect_to users_url, notice: 'Friend request accepted'
  end

  def reject
    friendship = Friendship.find_by(user_id: params[:friend_id], friend_id: current_user.id)
    friendship.destroy

    redirect_to users_url, notice: 'Friend request rejected'
  end
end
