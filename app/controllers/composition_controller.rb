class  CompositionController < ApplicationController
  def index
    @comps = Composition.all
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