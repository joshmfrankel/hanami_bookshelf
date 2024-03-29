require "features_helper"

RSpec.describe "List books" do
  let(:repository) { BookRepository.new }

  before do
    repository.clear

    repository.create(title: 'PoEAA', author: "Martin Fowler")
    repository.create(title: "TDD", author: "Keny Beck")
  end

  it "displays each book on the page" do
    visit "/books"

    within "#books" do
      expect(page).to have_selector(".book", count: 2)
    end
  end
end
