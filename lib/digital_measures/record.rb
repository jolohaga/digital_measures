module DigitalMeasures
  class Record
    include MultiMappable
    
    xml_name "Record"
    xml_convention :camelcase
    xml_accessor :username, from: "@username"
    
    element name: :schteach, type: Array[Schteach], opts: { as: [Schteach] }
  end
end
