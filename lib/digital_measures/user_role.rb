module DigitalMeasures
  class UserRole
    include MultiMappable
    
    xml_name "INDIVIDUAL-ACTIVITIES-University-Faculty"
    
    attribute :username, String
    
    def method
      :post
    end
    
    def path
      "/login/service/v4/UserRole/USERNAME:#{username}"
    end
  end
end
