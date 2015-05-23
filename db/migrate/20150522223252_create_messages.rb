class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.integer :sender_id
      t.integer :receiver_id
      t.integer :user_id
      t.string  :message_title
      t.text    :message_body

      t.timestamps

    end
  end
end
