module Publisher
  module S3
    module Base
      
      def connect
        return if AWS::S3::Base.connected?
        AWS::S3::Base.establish_connection!(:access_key_id => configuration.access_key, :secret_access_key => configuration.access_secret, :server => configuration.default_host)
      end
      
      def configuration
        Publisher::S3.configuration
      end

      def exists?(s3_key)
        # Remove starting slash from s3 key
        s3_key = s3_key.gsub(/^\//, '')

        AWS::S3::S3Object.exists?(s3_key, configuration.bucket_name)
      end

    end
  end
end