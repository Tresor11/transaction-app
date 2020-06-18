class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :transactions, dependent: :destroy
  mount_uploader :icon, IconUploader
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: true
  validates :creator_id, presence: true
  validates :icon, presence: true
end
