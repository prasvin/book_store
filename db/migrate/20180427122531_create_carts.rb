class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts, id: :uuid do |t|
      t.integer :state, null: false, default: 0

      t.references :user, null: false, type: :uuid, index: true

      t.timestamps
    end
  end
end
