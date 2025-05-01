class Trainer < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  has_one_attached :photo
  has_many :pokeballs
end
