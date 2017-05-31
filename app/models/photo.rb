class Photo < ApplicationRecord
	belongs_to :article
 	validates :id, presence: true
 	validates :image, presence: true
 	mount_uploader :image, PhotoUploader
end
