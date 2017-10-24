require "publisher/s3/version"
require "publisher/s3/configuration"
require "publisher/s3/base"
require "publisher/s3/upload"
require "publisher/s3/download"

module Publisher
  module S3
    class << self
      def configure
        yield(configuration)
      end

      def configuration
        @configuration ||= Configuration.new
      end
    end
  end
end
