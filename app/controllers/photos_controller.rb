class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]
  # 以下接續原有程式碼
  def index
    @photos = Photo.all
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_url #如果能成功執行@photo.save，就表示 @photo的內容通過了 model 的驗證，那麼就放心地導向 photos_url，離開目前的 action。
    else
      render :action => :new
    end #若無法儲存，表示@photo的內容沒有通過 model 驗證，表示必填資料不夠，所以，我們希望使用者再填一次。
     #表示 controller 這邊仍然停留在create action裡（意即使用者剛剛填寫、存在@photo的資料仍然存在），但回傳 new action 的樣版，也就是 new.html.erb，把 @photo 裡的資料再塞回 new.html.erb的表單，讓使用者做修改。
   end
   
   # def show
   #    # set_photo
   #  end
   #  def edit
   #    # set_photo
   #  end
   def destroy
      # set_photo
    @photo.destroy

    redirect_to photos_url
  end
  def update
     # set_photo
    if @photo.update_attributes(photo_params)
       redirect_to photo_path(@photo)
    else
      render :action => :edit
    end
  end 

  private
    
    def set_photo
    @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:title, :date, :description, :file_location)
    end
  
  
end