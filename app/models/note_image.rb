class NoteImage < ActiveRecord::Base
  belongs_to :note
  has_attached_file :image, :styles => { :large => "800>", :medium => "400>", :thumb => "100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
