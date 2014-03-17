class Lake < ActiveRecord::Base

before_save do
  self.slug = name.parameterize if slug.empty?
end

end
