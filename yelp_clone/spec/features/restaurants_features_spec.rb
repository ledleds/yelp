# require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants have been listed yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Pret')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('Pret')
      expect(page).not_to have_content('No restaurants have been listed yet')
    end
  end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Pret'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Pret'
      expect(current_path).to eq '/restaurants'
    end
  end
end
