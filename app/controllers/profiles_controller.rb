class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id: params[:id])
  end
end
