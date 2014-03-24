module DigitalMeasures
  class DeleteUser
    include MultiMappable
    
    attribute :username, String
    
    def path
      "/login/service/v4/User/USERNAME:#{username}"
    end
    
    def method
      :delete
    end
    
    def to_s
      ""
    end
  end
end
