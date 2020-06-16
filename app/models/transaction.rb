# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :group,optional:true
  belongs_to :author, class_name: 'User'
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }
  validates :amount, presence: true
end
