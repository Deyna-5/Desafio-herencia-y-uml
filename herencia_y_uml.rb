class Appoinment
    attr_accessor :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appoinment
    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day = day
    end

    def occurs_on?(day)
        if @day != day
            false
        else
            true
        end
    end

    def to_s
        "Reunion mensual en #{@location} sobre #{@purpose} el día #{@day} a las #{@hour}:#{@min}"
    end

end

class DailyAppointment < Appoinment
    def initialize(location, purpose, hour, min)
        super(location, purpose, hour, min)
    end

    def occurs_on?(hour, min)
        if @hour != hour && @min != min
            false
        else
            true
        end
    end

    def to_s
        "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}."
    end

end

class OneTimeAppointment < Appoinment
    attr_accessor :day, :month, :year
    def initialize(location, purpose, day, month, year, hour, min)
        super(location, purpose, hour, min)
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day, month, year)
        if @day != day && @month != month && @year != year
            false
        else 
            true
        end
    end

    def to_s
        "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}."
    end

end

mes = MonthlyAppointment.new('Nasa', 'Aliens', 8, 15, 23)
puts mes.to_s
puts mes.occurs_on?(23) #Probar el true
#puts mes.occurs_on?(22) #Probar el false

dia = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts dia.to_s
puts dia.occurs_on?(8, 15) #Probar el true
#puts dia.occurs_on?(7, 14) #Probar el false

anual = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 4, 6, 2019, 14, 30)
puts anual.to_s
puts anual.occurs_on?(4, 6, 2019) #Probar el true
#puts anual.occurs_on?(3, 5, 2018) #Probar el false