class Entry < ApplicationRecord
  validates :user_id, presence: true
  has_many :tags
  belongs_to :user
end
