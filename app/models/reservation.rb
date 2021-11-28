class Reservation < ApplicationRecord
  belongs_to :function

  validates :day, presence: { message: ": Fecha es requerida." }
end
