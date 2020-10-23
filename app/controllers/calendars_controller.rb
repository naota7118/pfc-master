# frozen_string_literal: true

class CalendarsController < ApplicationController
  def index
    @sampleuser = User.find_by(id: 2)
    if user_signed_in?
      @posts = Post.where(user_id: current_user.id)
    else
      @posts = Post.where(user_id: @sampleuser.id)
    end
  end
end
