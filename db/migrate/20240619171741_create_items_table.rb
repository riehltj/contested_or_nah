class CreateItemsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
