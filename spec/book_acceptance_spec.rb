require 'rails_helper'

feature "new book acceptance" do
    scenario 'the user is able to add a new book' do #sunny day test

        #go to the application
        visit root_path

        #click on the add book link
        expect(page).to have_content('Book Collection')
        click_on '+'

        #fill in new book form
        expect(page).to have_content("Add Book")
        fill_in 'Title', with: 'The Great Gatsby'
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        select 'Romance', from: "book_genre"
        fill_in 'Price', with: 20
        select "1995", from: "book_published_date_1i"
        select "April", from: "book_published_date_2i"
        select "10", from: "book_published_date_3i"

        #click on the submit button
        click_on "Add Book"

        #the user should see the main page with the new book
        expect(page).to have_content("The Great Gatsby")
        expect(Book.last.title).to eq("The Great Gatsby")
    end

    scenario 'ther user is not able to add an invalid book' do #rainy day test
        
        #go to the application
        visit root_path

        #click on the add book link
        expect(page).to have_content('Book Collection')
        click_on '+'

        #fill in new book form
        expect(page).to have_content("Add Book")
        fill_in 'Author', with: 'F. Scott Fitzgerald'
        select 'Romance', from: "book_genre"
        fill_in 'Price', with: 20
        select "1995", from: "book_published_date_1i"
        select "April", from: "book_published_date_2i"
        select "10", from: "book_published_date_3i"

        #click on the submit button
        click_on "Add Book"

        #the user should see the new form again since the input was invalid
        expect(page).to have_content("Add Book")
    end
end