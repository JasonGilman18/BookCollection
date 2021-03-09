require 'rails_helper'

RSpec.describe 'book integrations', type: :feature do
    
    it 'display the flash notice after adding, editing book' do #sunny day
        
        visit root_path

        #go to the new book page
        click_on '+'

        #fill in new book form
        fill_in 'Title', with: 'The Great Gatsby'
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        select 'Romance', from: "book_genre"
        fill_in 'Price', with: 20
        select "1995", from: "book_published_date_1i"
        select "April", from: "book_published_date_2i"
        select "10", from: "book_published_date_3i"

        #submit book
        click_on 'Add Book'

        #expect the main page to have flash notice
        expect(page).to have_content('The book "The Great Gatsby" has been ADDED!')

        #go to the edit book page
        click_on 'Edit', match: :first

        #fill in edit book form
        fill_in 'Title', with: 'Great Gatsby'
        
        #submit book edit
        click_on 'Save Edit'

        #expect the main page to have flash notice
        expect(page).to have_content('The book "Great Gatsby" has been UPDATED!')
    end

    it "does not display flash notice after returning to home before submitting add new book" do #rainy day
        
        visit root_path

        #go to the new book page
        click_on '+'

        #fill in new book form
        fill_in 'Title', with: 'The Great Gatsby'
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        select 'Romance', from: "book_genre"
        fill_in 'Price', with: 20
        select "1995", from: "book_published_date_1i"
        select "April", from: "book_published_date_2i"
        select "10", from: "book_published_date_3i"

        #submit book
        click_on 'Home'

        #expect the main page to have flash notice
        expect(page).not_to have_content('The book "The Great Gatsby" has been ADDED!')
        expect(page).to have_content("Book Collection")
    end
end