class User < ApplicationRecord
    belongs_to :city 
    has_many :gossip
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
