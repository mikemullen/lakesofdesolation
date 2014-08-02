require 'spec_helper'

describe "Static pages" do

  describe "About page" do
    it "should have the content 'Desolation'" do
      visit '/about'
      expect(page).to have_content('Desolation')
    end
  end

end
