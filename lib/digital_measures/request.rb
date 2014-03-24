module DigitalMeasures
  class Request
    attr_reader :server, :headers, :userpwd
    
    # ###################################
    #
    # Accepted args
    #
    # server, headers, user, password
    #
    def initialize(args)
      @server = args.fetch(:server, '')
      @headers = args.fetch(:headers, { "Accept" => "*/*", "Content-Type" => "text/plain", "Accept-Encoding" => "gzip, deflate", "Accept-Language" => "en-us" })
      @userpwd = "#{args.fetch(:user, '')}:#{args.fetch(:password, '')}"
    end
  end
end