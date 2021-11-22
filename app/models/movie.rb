class Movie < ApplicationRecord
    has_many :functions, dependent: :destroy
end
