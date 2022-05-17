class DragonSharesController < ApplicationController
  def show
    @dragon = Dragon.find_by!(id: params[:id])
    redirect_to root_path
  end
end
