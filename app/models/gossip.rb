class Gossip < ApplicationRecord
    belongs_to :user
    has_many :join_gossip_tags
    has_many :tag, through: :join_gossip_tags
end
