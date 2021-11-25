class Function < ApplicationRecord
  belongs_to :movie
  has_many :reservations, dependent: :destroy

  validates :room, presence: { message: "La sala es requerida." }
  validates :schedule, presence: { message: "El horario es requerido." }
  validates :room, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8],
  message: "La sala tiene que ser un número entre 1 y 8." }
  validates :schedule, inclusion: { in: ["Matine", "Tanda", "Noche"],
  message: "El horario tiene que estar dentro de las opciones Matine, Tanda o Noche." }
end
