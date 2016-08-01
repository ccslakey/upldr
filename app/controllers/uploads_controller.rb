class UploadsController < ApplicationController
	def index
       @uploads = Upload.all
    end

    def new
       @upload = Upload.new
    end

    def create
       @upload = Upload.new(upload_params)

       if @upload.save
		  flash[:notice] = "#{@upload.name} has been uploaded."
          redirect_to uploads_path
       else
          render "new"
       end

    end

    def destroy
       @upload = Upload.find(params[:id])
       @upload.destroy
	   flash[:notice] = "#{@upload.name} deleted."
       redirect_to uploads_path
    end

    private
       def upload_params
       params.require(:upload).permit(:name, :attachment)
    end
end
