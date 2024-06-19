class CuratedComposition < ApplicationRecord
  has_and_belongs_to_many :items
  has_and_belongs_to_many :champions

  validates :name, presence: true, uniqueness: true
end