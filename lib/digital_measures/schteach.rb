module DigitalMeasures
  class Schteach
    include MultiMappable
    
    xml_name "SCHTEACH"
    xml_convention :upcase
    
    element name: :tyt_term, type: String
    element name: :tyy_term, type: String
    element name: :title, type: String
    element name: :coursepre, type: String
    element name: :coursenum, type: String
    element name: :courseletter, type: String
    element name: :code, type: String
    element name: :section, type: String
    element name: :level, type: String
    element name: :enroll, type: String
    element name: :numinstructor, type: String
    element name: :chours, type: String
    element name: :delivery_mode, type: String
  end
end