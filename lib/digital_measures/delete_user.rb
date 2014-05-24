module DigitalMeasures
  class DeleteUser
    include MultiMappable
    
    attribute :username, String
    
    def path
      "#{PATH_ROOT}/User/USERNAME:#{username}"
    end
    
    def method
      :delete
    end
    
    def to_s
      ""
    end
  end
end
