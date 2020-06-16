class User < ApplicationRecord
  has_many :groups, foreign_key: 'creator_id', dependent: :destroy
  has_many :transactions, foreign_key: 'author_id', dependent: :destroy
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { minimun: 2, maximum: 20 }, uniqueness: true
end
