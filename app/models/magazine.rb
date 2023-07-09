require 'pry'

class Magazine
  extend All
  attr_accessor :name, :category

  @@all = []

  def initialize(name, category)
    raise ArgumentError, "name and category must be a String" unless name.is_a?(String) && category.is_a?(String)
    @name = name
    @category = category
    @@all << self
  end

  # def self.all
  #   @@all
  # end
  def to_s
    "Name: #{name}  , Category: #{category}"
  end

  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end

  def article_titles
    Article.all.select { |article| article.magazine == self }.map { |article| article.title }
  end

  def contributing_authors
    contributing_authors = Article.all.collect do |article|
      article.author if article.magazine == self
    end.compact
  
    contributing_authors.uniq.select { |author| contributing_authors.count(author) > 1 }
  end
end



