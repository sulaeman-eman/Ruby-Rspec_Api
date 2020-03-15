class Item < ApplicationRecord
  belongs_to :bookstore

  validates_presence_of :name
end
