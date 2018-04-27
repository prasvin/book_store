class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.float :amount, null: false

      t.references :user, null: false, type: :uuid, index: true
      t.references :cart, null: false, type: :uuid, index: true

      t.timestamps
    end
  end
end
