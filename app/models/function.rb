class Function < ApplicationRecord
  belongs_to :movie
  has_many :reservations, dependent: :destroy

  validates :room, presence: { message: ": La sala es requerida." }
  validates :schedule, presence: { message: ": El horario es requerido." }

end
