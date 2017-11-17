class Photo < ApplicationRecord
    mount_uploader :file_location, PhotoImageUploader
    validates_presence_of :title, :date, :description, :file_location  
end
=begin
讓表單中的所有區塊都成為必填項目。當使用者送出沒有滿足必填項目的表單時，在存進資料庫前就會被擋下來。
=end
