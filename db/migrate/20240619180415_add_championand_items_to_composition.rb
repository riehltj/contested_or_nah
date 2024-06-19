class AddChampionandItemsToComposition < ActiveRecord::Migration[7.0]
  def change
    add_column :compositions, :champion, :string
    add_column :compositions, :items, :string, array: true, default: []
  end
end
