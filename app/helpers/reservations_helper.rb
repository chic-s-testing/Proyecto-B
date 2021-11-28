module ReservationsHelper
  def seats_same_row?(seats)
    rows = [0, 0, 0, 0]

    seats.each do |seat|
      rows[0] = 1 if (seat.to_i).between?(1, 12)
      rows[1] = 1 if (seat.to_i).between?(13, 24)
      rows[2] = 1 if (seat.to_i).between?(25, 36)
      rows[3] = 1 if (seat.to_i).between?(37, 48)
    end

    if rows.sum == 1
      return true
    end
    false
  end

  def seats_are_valid?(seats)
    seats.each do |seat|
      if !(seat.to_i).between?(1, 48)
        return false
      end
    end
    true
  end

  def seats_exist?(seats, reservations, date)
    seats = seats.map { |seat| seat.to_i }
    reservations.each do |reservation|
      if (reservation.day == date) && seats.include?(reservation.seat)
        return true
      end
    end
    false
  end
end
