module DigitalMeasures
  class UserSchema
    include MultiMappable
    
    xml_convention :upcase
    
    xml_name "INDIVIDUAL-ACTIVITIES-University"
    
    attribute :username, String
    attribute :user_schema_key, String
    
    element name: :ac_year, type: String, opts: { in: "ADMIN" }
    element name: :college, type: String, opts: { in: "ADMIN/ADMIN_DEP" }
    element name: :dep, type: String, opts: { in: "ADMIN/ADMIN_DEP" }
    
    def method
      :post
    end
    
    def path
      "/login/service/v4/UserSchema/USERNAME:#{username}"
    end
    
    def validate_path
      "/login/service/v4/UserSchema/USERNAME:update-validate/#{username}/#{user_schema_key}"
    end
  end
end
