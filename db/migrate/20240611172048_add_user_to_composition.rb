class AddUserToComposition < ActiveRecord::Migration[7.0]
  def change
    add_reference :compositions, :user, type: :bigint, null: true, foreign_key: true
  end
end
