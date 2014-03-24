require 'roxml'
require 'virtus'

module DigitalMeasures
  class Resource
    include ROXML
    xml_convention :camelcase
    
    def self.post_element(post_element = nil)
      return(@post_element || {}) unless post_element.present?
      @post_element = post_element
    end
    
    # ############################
    #
    # A Digital Measures resource is comprised of:
    # 1) a resource path
    # 2) an HTTP verb (method)
    # 3) a message body containing XML structure and data
    #
    def method
      :post
    end
    
    def self.element(args)
      opts = args.fetch(:opts, {})
      attribute args[:name], args[:type]
      xml_accessor args[:name], opts.merge(post_element)
    end
    
    def to_s
      to_xml.to_s
    end
  end
end
