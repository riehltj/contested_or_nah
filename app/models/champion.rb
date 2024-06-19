class Champion < ApplicationRecord
  has_and_belongs_to_many :curated_compositions
end