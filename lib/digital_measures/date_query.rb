module DigitalMeasures
  class DateQuery
    include Virtus.model
    
    attribute :start_date, Date
    attribute :end_date, Date
    
    def start_date=(date)
      raise ArgumentError, "must be Date" unless date.respond_to?(:to_date)
      super(date.to_date)
    end
    
    def end_date=(date)
      raise ArgumentError, "must be Date" unless date.respond_to?(:to_date)
      super(date.to_date)
    end
    
    def to_s
      return "" if (start_date.nil? || end_date.nil?)
      
      "?startDate=#{start_date}?endDate=#{end_date}"
    end
  end
end
