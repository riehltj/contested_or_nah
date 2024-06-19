class CreateJoinTableCuratedChampions < ActiveRecord::Migration[7.0]
  def change
    create_table :champions_curated_compositions, id: false do |t|
      t.belongs_to :curated_composition
      t.belongs_to :champion
    end
  end
end
