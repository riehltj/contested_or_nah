module Admin
  class CompositionsController < AdminController
    def edit
      @composition = CuratedComposition.find(params[:id])
    end

    def update
      @composition = CuratedComposition.find(params[:id])
      items = []

      if composition_params[:item_id_1]
        item = Item.find(composition_params[:item_id_1])
        items << item
      end
      
      if composition_params[:item_id_2]
        item = Item.find(composition_params[:item_id_2])
        items << item
      end
      
      if composition_params[:item_id_3]
        item = Item.find(composition_params[:item_id_3])
        items << item
      end
      @composition.items = items


      if composition_params[:champion_id]
        champion = Champion.find(composition_params[:champion_id])
        @composition.champions = [champion]
      end

      @composition.name = composition_params[:name] if composition_params[:name]

      if @composition.save
        flash[:notice] = "Composition updated!"
      redirect_to edit_admin_composition_path(@composition)
      end
    end

    private

    def composition_params
      params.require(:curated_composition).permit(:name, :item_id_1, :item_id_2, :item_id_3, :champion_id)
    end
  end
end
