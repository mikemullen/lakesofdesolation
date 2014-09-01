class Note < ActiveRecord::Base
  has_attached_file :photo, :styles => { :xlarge => "1600>", :large => "800>", :medium => "400>", :thumb => "100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  default_scope -> { order('sort_date DESC') }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  def should_generate_new_friendly_id?
  	title_changed?
  end

  def slug_candidates
  	[
  	  :title,
  	  [:title, :sort_date],
  	  [:title, :sort_date, :author]
  	]
  end
end
