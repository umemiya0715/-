class DragonSharesController < ApplicationController
  def show
    @dragon = Dragon.find_by!(dragon_id: params[:dragon_id])
  end
end
