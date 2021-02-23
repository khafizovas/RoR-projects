# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    @user_plants_count = current_user.plants.count if user_signed_in?
  end
end
