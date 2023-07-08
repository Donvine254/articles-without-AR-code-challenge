require "spec_helper"

describe Article do
  describe "#initialize" do
    it "sets the author, magazine, and title correctly" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Example Magazine", "News")
      title = "Sample Article"

      article = Article.new(author, magazine, title)

      expect(article.author).to eq(author)
      expect(article.magazine).to eq(magazine)
      expect(article.title).to eq(title)
    end
  end

  describe "#title" do
    it "returns the title for that given article" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Example Magazine", "News")
      title = "Sample Article"

      article = Article.new(author, magazine, title)

      expect(article.title).to eq(title)
    end
  end

  describe ".all" do
    it "returns an array of all Article instances" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Example Magazine", "News")
      title = "Sample Article"

      article1 = Article.new(author, magazine, title)
      article2 = Article.new(author, magazine, title)

      expect(Article.all).to contain_exactly(article1, article2)
    end
  end

  describe "#author" do
    it "returns the author for that given article" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Example Magazine", "News")
      title = "Sample Article"

      article = Article.new(author, magazine, title)

      expect(article.author).to eq(author)
    end
  end

  describe "#magazine" do
    it "returns the magazine for that given article" do
      author = Author.new("John Doe")
      magazine = Magazine.new("Example Magazine", "News")
      title = "Sample Article"

      article = Article.new(author, magazine, title)

      expect(article.magazine).to eq(magazine)
    end
  end
end
