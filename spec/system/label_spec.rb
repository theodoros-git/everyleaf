require 'rails_helper'
RSpec.describe 'Fonction de gestion des tâches', type: :system do
    before do
        FactoryBot.create(:second_user)
        visit new_session_path
        fill_in 'session[email]', with: 'admin1@gmail.com'
        fill_in 'session[password]', with: 'password'
        click_button 'signin'
        # あらかじめタスク一覧のtestで使用するためのタスクを二つ作成する
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        FactoryBot.create(:label)
        FactoryBot.create(:labeling)
    end

    describe 'Fonction de recherche' do
        context "Search by title" do
            it "Return a list " do
            visit tasks_path
            fill_in "search_title",	with: "title" 
            expect(page).to have_content 'title' 
            end
            
        end
    end 
end