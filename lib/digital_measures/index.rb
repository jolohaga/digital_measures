module DigitalMeasures
  class Index
    include MultiMappable
    
    xml_convention :camelcase
    
    xml_accessor :index_key, from: "@indexKey"
    element name: :index_entries, type: Array[IndexEntry], opts: {as: [IndexEntry]}
  end
end
