require 'linkedin'

module MyDrive
  module Linkedin
    class Connection

      def initialize
        @client = LinkedIn::Client.new(ENV['LINKEDIN_TOKEN'], ENV['LINKEDIN_SECRET'])
      end
      
    end
  end
end
