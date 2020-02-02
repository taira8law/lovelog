class ToppagesController < ApplicationController
  def index
    if logged_in?
      @lover = Lover.find_by(user_id: current_user.id, status: '交際中')
    end
  end
end
