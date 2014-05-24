module DigitalMeasures
  class SchemaIndex
    include MultiMappable
    
    xml_name "Indexes"
    xml_convention :camelcase
    
    xml_accessor :schema_key, from: "@schemaKey"
    
    element name: :indexes, type: Array[Index], opts: {as: [Index]}
  end
end
