class Draft < ActiveRecord::Base
  has_many :rounds
  has_many :teams
  has_many :players

  validates :year, presence: true
  validates :league_id, presence: true
end
