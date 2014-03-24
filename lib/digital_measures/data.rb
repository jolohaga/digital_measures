module DigitalMeasures
  class Data < Resource
    include Virtus.model
    
    xml_name "Data"
    
    xml_accessor :username, from: "@username", in: "Record"
    
    def path
      "/login/service/v4/SchemaData/INDIVIDUAL-ACTIVITIES-University"
    end
    
    def validate_path
      "/login/service/v4/SchemaData:validate/INDIVIDUAL-ACTIVITIES-University"
    end
  end
end
