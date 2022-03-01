class DragonSharesController < ApplicationController
  def show
    @dragon = Dragon.find_by!(id: params[:id])
  end
end
