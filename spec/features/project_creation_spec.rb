require 'rails_helper'

feature "Project Creation", :type => :feature, :js => true do
  context 'when using AJAX' do
    it 'display modal and complete creation'  do
      visit projects_path
      click_link('new-project-ajax')
      # find(:link_or_button, 'new-project-ajax').click
      within('#myModal') do
        expect(page).to have_content('New Project')

        find('#project_team').visible?
        fill_in('project_team', :with => 'Capybara Team')
        fill_in('project_title', :with => 'Capybara Title')
        fill_in('project_description', :with => 'Capybara Description')

        find('#project_deadline').visible?
        fill_in('project_deadline', :with => '12/12/2016')
        click_button('Create Project')
      end
      expect(page).to have_content('Capybara Team')
    end
  end
end
