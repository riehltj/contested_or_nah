class CuratedComposition < ApplicationRecord
  has_many :items, dependent: :nullify
  has_many :champions, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end