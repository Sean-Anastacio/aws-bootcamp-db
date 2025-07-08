class HomesController < ApplicationController
  def show
    @first_user = User.find_by(id: 1)
  end
end
