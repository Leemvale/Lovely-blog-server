class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])

    User.transaction do
      Friendship.create!(user: current_user, friend: friend)
      Friendship.create!(user: friend, friend: current_user)
    end

    redirect_to profile_path(params[:friend_profile])
  end

  def destroy
    friend = User.find(params[:friend_id])

    User.transaction do
      Friendship.where(user: current_user, friend: friend).first.destroy
      Friendship.where(user: friend, friend: current_user).first.destroy
    end

    redirect_to profile_path(params[:friend_profile])
  end
end