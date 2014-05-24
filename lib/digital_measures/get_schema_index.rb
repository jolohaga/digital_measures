module DigitalMeasures
  class GetSchemaIndex
    include MultiMappable
    
    def path
      "#{PATH_ROOT}/SchemaIndex/#{SCHEMA_KEY}"
    end
    
    def method
      :get
    end
    
    def to_s
      ""
    end
  end
end
