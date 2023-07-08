require_relative './config/environment.rb'
# Please copy/paste all three classes into this file to submit your solution!
module All
    def all
        ObjectSpace.each_object(self).to_a
      end
end

# Author class
class Author
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def articles
      Article.all.select { |article| article.author.name == self.name }
    end
  
    def magazines
      articles.map { |article| article.magazine }.uniq
    end
  
    def add_article(magazine, title)
      raise ArgumentError unless magazine.is_a?(Magazine)
      Article.new(self, magazine, title)
    end
  
    def topic_areas
      magazines.map { |magazine| magazine.category }.uniq
    end
  end
  
#   Article class
  class Article
    extend All
     attr_reader :author, :magazine, :title
   
     @@all = []
   
     def initialize(author, magazine, title)
       @author = author
       @magazine = magazine
       @title = title
       @@all << self
     end
   end
# Magazine class
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