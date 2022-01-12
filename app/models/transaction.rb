class Transaction < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :author, class_name: 'User'
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :amount, :author_id, presence: true
end
