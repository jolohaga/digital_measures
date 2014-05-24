module DigitalMeasures
  class IndexEntry
    include MultiMappable
    
    xml_convention :camelcase
    
    xml_accessor :entry_key, from: "@entryKey"
    xml_accessor :href, in: 'Data', from: "@xlink:href"
  end
end
