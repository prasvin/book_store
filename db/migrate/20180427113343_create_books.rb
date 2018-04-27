class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :isbn, null: false
      t.boolean :available, null: false, default: true
      t.float :price, null: false

      t.timestamps

      t.index %i[isbn], unique: true
    end
  end
end
