require 'roxml'
require 'virtus'

module DigitalMeasures::MultiMappable  
  module ClassMethods  
    def post_element(post_element = nil)
      return(@post_element || {}) unless post_element.present?
      @post_element = post_element
    end
  
    def element(args)
      opts = args.fetch(:opts, {})
      attribute args[:name], args[:type]
      xml_accessor args[:name], opts.merge(post_element)
    end
  end
  
  def self.included(base)
    base.class_eval do
      include ROXML
      include Virtus.model
    end
    base.extend(ClassMethods)
  end
  
  def to_s
    to_xml.to_s
  end
end