require 'sinatra/base'
require "#{File.dirname(__FILE__)}/lib/s3_uploader"

module S3Uploader
  class App < Sinatra::Base
    register Sinatra::S3Uploader
    
    configure do
      uploader_setup 'access_key', 'secret_key'
    end
    
    get "/" do
      upload_form_for 'com.bucket.name'
    end
    
    post "/" do
      upload_file
    end
  end
end

run S3Uploader::App.new