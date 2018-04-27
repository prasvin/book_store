class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items, id: :uuid do |t|
      t.integer :quantity, null: false, default: 1

      t.references :book, null: false, type: :uuid, index: true
      t.references :cart, null: false, type: :uuid, index: true
      t.references :order, type: :uuid, index: true

      t.timestamps
    end
  end
end
