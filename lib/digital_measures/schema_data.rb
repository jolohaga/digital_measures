module DigitalMeasures
  class SchemaData
    include MultiMappable
    
    xml_name "Data"
    
    element name: :records, type: Array[Record], opts: { as: [Record] }
    
    def method
      :post
    end
    
    def path
      "#{PATH_ROOT}/SchemaData/#{SCHEMA_KEY}"
    end
  end
end
