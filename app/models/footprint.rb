class Footprint < ApplicationRecord
  belongs_to :user

  validates :duration_on_terminal, presence: true
  validates :terminal_category, presence: true
  validates :data_size, presence: true
  validates :country, presence: true
end
