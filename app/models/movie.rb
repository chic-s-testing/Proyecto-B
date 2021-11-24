class Movie < ApplicationRecord
    has_many :functions, dependent: :destroy

    validates :name, :photo, :initialDate, :finalDate, presence: true
    validate :valid_dates?

    def valid_dates?
        return unless initialDate? && finalDate?

        if !finalDate.after?(initialDate)
            errors.add(:initialDate, "must be before Final Date.")
            errors.add(:finalDate, "must be after Initial Date.")
        end

        if !initialDate.after?(Date.today)
            errors.add(:initialDate,"must be after today.")
        end

        if !finalDate.after?(Date.today)
            errors.add(:finalDate,"must be after today.")
        end
    end
end
