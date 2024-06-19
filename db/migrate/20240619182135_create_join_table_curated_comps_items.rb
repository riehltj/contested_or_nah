class CreateJoinTableCuratedCompsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :curated_compositions_items, id: false do |t|
      t.belongs_to :curated_composition
      t.belongs_to :item
    end
  end
end
