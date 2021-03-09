require 'rails_helper'

RSpec.describe Book, type: :model do

    #
    # test book model's validations
    #

    subject do
        described_class.new(
            title: "The Great Gatsby",
            author: "F. Scott Fitzgerald",
            genre: "Romance",
            price: "20",
            published_date: Date.new(1925, 4, 10)
        )
    end

    it 'Book is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'Book is not valid without a title' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'Book is not valid without a author' do
        subject.author = nil
        expect(subject).not_to be_valid
    end

    it 'Book is not valid without a genre' do
        subject.genre = nil
        expect(subject).not_to be_valid
    end

    it 'book is not valid without a price' do
        subject.price = nil
        expect(subject).not_to be_valid
    end

    it 'book is not valid without a date' do
        subject.published_date = nil
        expect(subject).not_to be_valid
    end
end