class User < ActiveRecord::Base

  has_many :rooms
  has_many :reservations
  has_many :messages

  has_many :references_to_senders, class_name: "Message", foreign_key: "receiver_id"
  has_many :senders, through: :references_to_senders

  has_many :references_to_receivers, class_name: "Message", foreign_key: "sender_id"
  has_many :receivers, through: :references_to_receivers

  has_secure_password

end
