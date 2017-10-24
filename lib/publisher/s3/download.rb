module Publisher
  module S3
    module Download
      extend Publisher::S3::Base

      class FileNotFound < StandardError; end

      def self.download(s3_key, file_path = "/tmp/s3-assets")
        connect
        
        s3_file_content = file_content(s3_key)
        
        if s3_file_content
          file_path = File.join(file_path, s3_key)
          dir_path  = File.dirname(file_path)
          FileUtils.mkdir_p(dir_path)

          local_file = File.open(file_path, 'wb')
          local_file.puts(s3_file_content)
          local_file.close
          file_path
        else
          raise FileNotFound, "S3 file not found - #{s3_key}"
        end

      end
      
      def self.file_content(s3_key)
        connect

        s3_key = s3_key.gsub(/^\//, '')
        return unless exists?(s3_key)

        s3_file = AWS::S3::S3Object.find(s3_key, configuration.bucket_name)
        s3_file.value
      end

    end
  end
end