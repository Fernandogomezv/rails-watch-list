class Review < ApplicationRecord
  belongs_to :list

  validates :content, presence: true
  validates :stars, inclusion: { in: 0..5 }, presence: true, numericality: { only_integer: true }
end
