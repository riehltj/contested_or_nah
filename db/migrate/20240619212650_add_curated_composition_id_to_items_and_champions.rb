class AddCuratedCompositionIdToItemsAndChampions < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :curated_composition, foreign_key: true, type: :uuid
    add_reference :champions, :curated_composition, foreign_key: true, type: :uuid
  end
end