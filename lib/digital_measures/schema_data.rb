module DigitalMeasures
  class SchemaData
    include MultiMappable
    
    xml_name "Data"
    
    element name: :records, type: Array[DigitalMeasures::Record], opts: { as: [DigitalMeasures::Record] }
    
    def method
      :post
    end
    
    def path
      "/login/service/v4/SchemaData/#{DigitalMeasures::SCHEMA_KEY}"
    end
  end
end
