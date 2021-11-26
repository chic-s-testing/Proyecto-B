module FunctionsHelper
    def options_for_rooms()
    end

    def check_dates(initial_date, final_date, aux_initial_date, aux_final_date)
        dates = [initial_date, final_date]
        dates.each do |date|
            if date.between?(aux_initial_date, aux_final_date)
                return false
            end
        end
        return true
    end
end
