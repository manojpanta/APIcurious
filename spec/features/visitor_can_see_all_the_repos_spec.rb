require 'rails_helper'
feature 'visitor visiting root path' do
  scenario 'sign ins with github credentials can log in' do
    visit root_path
    

  end
end
