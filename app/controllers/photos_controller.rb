# PhotosController.rb
class PhotosController < ApplicationController
    before_action :signed_in_user
    def upload
        @photo = Photo.new
        @photo.image = params[:upload_file]
        @photo.user_id = current_user.id
        success = true
        msg = '上传成功'
        file_path = ''
        if @photo.save
            success = true
            render json: { :success=> success, :msg=>msg, :file_path=> @photo.image.url }
        else
            success=false
          render json: { :success=> false }
        end
    end
end