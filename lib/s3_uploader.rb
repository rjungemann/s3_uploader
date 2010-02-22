require 'aws/s3'

module Sinatra
  module S3Uploader
    module Helpers
      def upload_form_for bucket_name, parameter = "file"
        %{<form method="post" action="/" enctype='multipart/form-data'>
    <input type="hidden" name="bucket_name" value="#{bucket_name}"      
    
    <input type="file" name="#{parameter}">
    <input type="submit" value="Submit">
</form>}
      end
      
      def upload_file parameter = "file", filename = nil
        filename = params[parameter][:filename] unless filename
        file = File.open(params[parameter][:tempfile].path) 
        bucket_name = params[:bucket_name]
        
        AWS::S3::S3Object.store(filename, file, bucket_name)
      end
    end
    
    def self.registered(app)
      app.helpers Sinatra::S3Uploader::Helpers
    end
    
    def uploader_setup access_key, secret_key
      AWS::S3::Base.establish_connection!(:access_key_id => access_key, :secret_access_key => secret_key)
    end
  end
  
  register Sinatra::S3Uploader
end