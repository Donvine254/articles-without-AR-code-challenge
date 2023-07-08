require "spec_helper"
describe Author do
  describe "#initialize" do
    it "sets the name correctly" do
      author = Author.new("John Doe")
      expect(author.name).to eq("John Doe")
    end
  end

  describe "#articles" do
    it "returns an array of Article instances written by the author" do
      author = Author.new("Jane Doe")
      magazine = Magazine.new("Example Magazine", "News")
      article1 = Article.new(author, magazine, "Article 1")
      article2 = Article.new(author, magazine, "Article 2")

      expect(author.articles).to contain_exactly(article1, article2)
    end
  end

  describe "#magazines" do
    it "returns a unique array of Magazine instances the author has contributed to" do
      author_1 = Author.new("example author")
      magazine1 = Magazine.new("Magazine 1", "Category 1")
      magazine2 = Magazine.new("Magazine 2", "Category 2")

      Article.new(author_1, magazine1, "Article_1")
      Article.new(author_1, magazine2, "Article_2")
      Article.new(author_1, magazine2, "Article_3")

      expect(author_1.magazines).to contain_exactly(magazine1, magazine2)
    end
  end

  describe "#add_article" do
    it "creates a new Article associated with the author and the given magazine and title" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Example Magazine", "News")

      expect {
        author.add_article(magazine, "New Article")
      }.to change { Article.all.length }.by(1)
    end
  end

  describe "#topic_areas" do
    it "returns a unique array of strings with the categories of the magazines the author has contributed to" do
      author = Author.new("Jay Z")
      magazine_1 = Magazine.new("Magazine_1", "Category_1")
      magazine_2 = Magazine.new("Magazine_2", "Category_2")
      magazine_3 = Magazine.new("Magazine_3", "Category_2")

      Article.new(author, magazine_1, "Article 3")
      Article.new(author, magazine_2, "Article 4")
      Article.new(author, magazine_3, "Article 5")

      expect(author.topic_areas).to contain_exactly("Category_1", "Category_2")
    end
  end
end
