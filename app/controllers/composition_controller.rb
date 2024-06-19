class  CompositionController < ApplicationController
  def index
    if user_signed_in?
      @comps = Composition.where(user_id: current_user.id)
    else
      @comps =  CuratedComposition.all
    end
  end

  def update
    @comp = Composition.find(params[:id])
    if @comp.update!(composition_params)
      flash.now.notice = "Composition updated!"
    else
      flash.now.alert = "Composition not updated!"
    end
# TODO Render the alerts!
  end

  def destroy
    
  end

  private
  def composition_params
    params.require(:composition).permit(:name)
  end
end