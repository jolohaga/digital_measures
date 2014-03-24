module DigitalMeasures
  class User < Resource
    include Virtus.model

    xml_accessor :username, :from => '@username'
    
    element name: :first_name, type: String
    element name: :middle_name, type: String
    element name: :last_name, type: String
    element name: :email, type: String
    element name: :local_authentication, type: String
    
    def path
      "/login/service/v4/User"
    end
    
    def validate_path
      "/login/service/v4/User:create-validate"
    end
  end
end
