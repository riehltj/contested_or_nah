class CreateChampionsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :champions do |t|
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
