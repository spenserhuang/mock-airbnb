class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|

      t.integer :user_id
      t.float   :price
      t.boolean :availability
      t.string  :name
      t.text    :description
      t.string  :country
      t.string  :state
      t.string  :city
      t.string  :street

      t.timestamps

    end
  end
end
