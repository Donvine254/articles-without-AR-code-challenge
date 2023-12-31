class Author
  attr_reader :name

  def initialize(name)
    @name = name
  end
  def to_s
    @name
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


