module DigitalMeasures
  class UserRole < Resource
    include Virtus.model
    
    xml_name "INDIVIDUAL-ACTIVITIES-University-Faculty"
    
    attribute :username, String
    
    def path
      "/login/service/v4/UserRole/USERNAME:#{username}"
    end
  end
end
