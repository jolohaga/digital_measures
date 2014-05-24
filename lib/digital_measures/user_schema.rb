module DigitalMeasures
  class UserSchema
    include MultiMappable
    
    xml_convention :upcase
    
    xml_name SCHEMA_KEY
    
    attribute :username, String
    attribute :user_schema_key, String
    
    element name: :ac_year, type: String, opts: { in: "ADMIN" }
    element name: :college, type: String, opts: { in: "ADMIN/ADMIN_DEP" }
    element name: :dep, type: String, opts: { in: "ADMIN/ADMIN_DEP" }
    
    def method
      :post
    end
    
    def path
      "#{PATH_ROOT}/UserSchema/USERNAME:#{username}"
    end
    
    def validate_path
      "#{PATH_ROOT}/UserSchema/USERNAME:update-validate/#{username}/#{user_schema_key}"
    end
  end
end
