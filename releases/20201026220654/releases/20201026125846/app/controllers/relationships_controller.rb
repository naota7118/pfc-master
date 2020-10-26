# frozen_string_literal: true

class RelationshipsController < ApplicationController
  # before_action :set_user

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to @user
  end

  # private
  # def
  #   @user = User.find(params[:relationship][:follow_id])
  # end
end
