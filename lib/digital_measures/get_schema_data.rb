module DigitalMeasures
  class GetSchemaData
    include MultiMappable
    
    xml_name "Data"
    
    attribute :index_key_entry_keys, String
    attribute :entity_keys, String
    attribute :date_query, DateQuery
    
    def date_query=(dq)
      raise ArgumentError, "must be type DateQuery" unless dq.class == DateQuery
      super(dq)
    end
    
    def path
      raise ArgumentError, "index_key_entry_keys and entity_keys can not both be nil" unless (index_key_entry_keys || entity_keys)
      raise ArgumentError, "date_query must be DateQuery" unless date_query.nil? || date_query.class == DateQuery
      
      "/login/service/v4/SchemaData/#{DigitalMeasures::SCHEMA_KEY}".tap do |path|
        path << "/#{index_key_entry_keys}" if index_key_entry_keys
        path << "/#{entity_keys}" if entity_keys
        path << "#{date_query.to_s}" if date_query
      end
    end
    
    def method
      :get
    end
    
    def to_s
      ""
    end
  end
end
