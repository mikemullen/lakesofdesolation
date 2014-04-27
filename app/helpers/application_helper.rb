module ApplicationHelper

  # Returns full title for each page
  def full_title(page_title)
  	base_title = "Lakes of Desolation"
  	if page_title.empty?
  	  base_title
  	else
  	  "#{base_title} | #{page_title}"
  	end
  end

  # Switch background image with fall-back
  def bg_img(file_name)
  	fall_back = " body {
  					background: grey;
  					margin: 0;
  					padding: 0;
					} "
	if file_name.empty?
	  fall_back
	else
    pic_path = asset_url(file_name)
	  			"body {
  					background: url(#{pic_path}) no-repeat center center fixed;
  					-webkit-background-size: cover;
  					-moz-background-size: cover;
  					-o-background-size: cover;
  					background-size: cover;
  					margin: 0;
  					padding: 0;
					}"
	end
  end

end
