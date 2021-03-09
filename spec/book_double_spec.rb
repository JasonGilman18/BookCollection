require 'rails_helper'

RSpec.describe 'book double' do

    it "test stub book model" do
        
        #create book stub
        test_book = double("Book")

        #add attributes to book stub
        allow(test_book).to receive(:title).and_return("The Great Gatsby")
        allow(test_book).to receive(:author).and_return("F. Scott Fitzgerald")
        allow(test_book).to receive(:genre).and_return("Romance")
        allow(test_book).to receive(:price).and_return(20)
        allow(test_book).to receive(:published_date).and_return(Date.new(1925, 4, 10))

        #expect book stub to have correct attributes
        expect(test_book.title).to eq("The Great Gatsby")
        expect(test_book.author).to eq("F. Scott Fitzgerald")
        expect(test_book.genre).to eq("Romance")
        expect(test_book.price).to eq(20)
        expect(test_book.published_date).to eq(Date.new(1925, 4, 10))
        
    end
end