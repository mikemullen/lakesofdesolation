require 'spec_helper'

describe "Static pages" do

  describe "About page" do
    it "should have the content 'It is a way'" do
      visit '/static_pages/about'
      expect(page).to have_content('It is a way')
    end
  end

end
