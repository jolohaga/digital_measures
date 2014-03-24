module DigitalMeasures
  class Record
    include MultiMappable
    
    xml_name "Record"
    xml_convention :camelcase
    xml_accessor :username, from: "@username"
    
    element name: :schteach, type: Array[DigitalMeasures::Schteach], opts: { as: [DigitalMeasures::Schteach] }
  end
end