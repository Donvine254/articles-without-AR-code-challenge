require 'pry'
class Magazine
  attr_accessor :name, :category

  @@all = []

  def initialize(name, category)
    raise ArgumentError, "name and category must be a String" unless name.is_a?(String) && category.is_a?(String)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end

  def article_titles
    Article.all.select { |article| article.magazine == self }.map { |article| article.title }
  end

  def contributing_authors
    # Article.all.select { |article| article.magazine == self }
    #            .group_by { |article| article.author }
    #            .select { |_author, articles| articles.length > 2 }
    #            .keys
        magazine_authors = Article.all.collect{|article| article.author}
        magazine_authors.tally.each {|key, value|  value > 2}
        magazine_authors
  end
end



