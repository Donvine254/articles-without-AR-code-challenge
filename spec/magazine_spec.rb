require "spec_helper"

  describe Magazine do
    describe "#initialize" do
      it "sets the name and category correctly" do
        magazine = Magazine.new("Example Magazine", "News")
  
        expect(magazine.name).to eq("Example Magazine")
        expect(magazine.category).to eq("News")
      end
    end
  
    describe ".find_by_name" do
      it "returns the first magazine object that matches the given name" do
        magazine1 = Magazine.new("Magazine 1", "Category 1")
        magazine2 = Magazine.new("Magazine 2", "Category 2")
  
        expect(Magazine.find_by_name("Magazine 1")).to have_attributes(name: "Magazine 1", category: "Category 1")
      end
    end
  
    describe "#article_titles" do
      it "returns an array of strings with the titles of all articles written for the magazine" do
        magazine = Magazine.new("Example Magazine", "News")
        author = Author.new("John Doe")
  
        Article.new(author, magazine, "Article 1")
        Article.new(author, magazine, "Article 2")
  
        expect(magazine.article_titles).to contain_exactly("Article 1", "Article 2")
      end
    end
  
    describe "#contributing_authors" do
      it "returns an array of authors who have written more than 2 articles for the magazine" do
        forbes = Magazine.new("Forbes", "News")
        author1 = Author.new("John Doe")
        author2 = Author.new("Jane Smith")
  
        Article.new(author1, forbes, "Article 1")
        Article.new(author1, forbes, "Article 2")
        Article.new(author2, forbes, "Article 3")
  
        expect(forbes.contributing_authors).to contain_exactly(author1)
      end
    end
  end