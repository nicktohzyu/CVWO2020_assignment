class Entry < ApplicationRecord
  validates :user_id, presence: true
  has_many :tags, dependent: :destroy
  belongs_to :user
end
