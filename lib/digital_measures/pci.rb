module DigitalMeasures
  class Pci
    include MultiMappable
    
    xml_name "PCI"
    xml_convention :upcase
    
    element name: :prefix, type: String
    element name: :fname, type: String
    element name: :pfname, type: String
    element name: :mname, type: String
    element name: :lname, type: String
    element name: :suffix, type: String
    element name: :office_address, type: String
    element name: :email, type: String
    element name: :website, type: String
  end
end
