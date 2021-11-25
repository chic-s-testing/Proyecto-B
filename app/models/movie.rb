class Movie < ApplicationRecord
    has_many :functions, dependent: :destroy

    validates :name, presence: { message: ": Nombre es requerido." }
    validates :photo, presence: { message: ": Foto es requerida." }
    validates :initialDate, presence: { message: ": Fecha inicial es requerida." }
    validates :finalDate, presence: { message: ": Fecha final es requerida." }
    validate :valid_dates?

    def valid_dates?
        return unless initialDate? && finalDate?

        if !finalDate.after?(initialDate)
            errors.add(:finalDate, ": Fecha final debe ser posterior a la fecha inicial.")
        end

        if !initialDate.after?(Date.today)
            errors.add(:initialDate,": Fecha inicial debe ser posterior a la fecha de hoy.")
        end

        if !finalDate.after?(Date.today)
            errors.add(:finalDate,": Fecha final debe ser posterior a la fecha de hoy.")
        end
    end
end
