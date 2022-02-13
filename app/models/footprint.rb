class Footprint < ApplicationRecord

  before_update do
    recalculate_footprint
  end

  belongs_to :user

  validates :duration_on_terminal, presence: true
  validates :terminal_category, presence: true
  validates :data_size, presence: true
  validates :country, presence: true
  validates :carbon_footprint, presence: true

  private

  def recalculate_footprint
    if self.country == "France"
      area = 59
    elsif self.country == "USA"
      area = 447
    else
      area = 596
    end

    if self.terminal_category == "phone"
      terminal = 1.1**-4
    else
      terminal = 3.2**-4
    end
    self.carbon_footprint = self.data_size * (7.2**-11 + 1.52**-10)* 59 + self.duration_on_terminal * terminal * area * self.additional_factor
  end
end
