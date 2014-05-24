module DigitalMeasures
  class UserRole
    include MultiMappable
    
    xml_name "#{SCHEMA_KEY}-Faculty"
    
    attribute :username, String
    
    def method
      :post
    end
    
    def path
      "#{PATH_ROOT}/UserRole/USERNAME:#{username}"
    end
  end
end
