class UsersController < ApplicationController

  def biggest_closet
    @user = User.biggest_closet
  end

end
