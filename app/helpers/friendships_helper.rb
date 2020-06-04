module FriendshipsHelper
  def friendship(user_id, friend_id)
    Friendship.find_by(user_id: user_id, friend_id: friend_id).id
  end
end
