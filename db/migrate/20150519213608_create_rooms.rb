class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|

      t.belongs_to :user, index: true

      t.float :price,          null: false
      t.boolean :availability, null: false
      t.string :name,          null: false
      t.text :description,     null: false
      t.string :country,       null: false
      t.string :state,         null: false
      t.string :city,          null: false
      t.string :street,        null: false

      t.timestamps null: false

    end
  end
end
