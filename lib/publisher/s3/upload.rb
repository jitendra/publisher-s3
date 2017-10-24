module Publisher
  module S3
    module Upload
      extend Publisher::S3::Base

      def self.upload(file_content, s3_key)
        connect

        AWS::S3::S3Object.store(s3_key, file_content, configuration.bucket_name, :access => :public_read)
      end

      def self.copy(source_s3_key, target_s3_key)
        connect

        unless exists?(target_s3_key)
          AWS::S3::S3Object.copy(source_s3_key, target_s3_key, configuration.bucket_name)
        end
      end

    end
  end
end