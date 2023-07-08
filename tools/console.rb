require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
#run rspec to test all different scenarios
timothy = Author.new("Timothy")
james = Author.new('James')
jim = Author.new('Jim')

outlook = Magazine.new("outlook","fashion")
forbes =Magazine.new("forbes","business")
playboy =Magazine.new("playboy","fashion")

art1= Article.new(james,outlook,"kenyans will continue to suffer")
art2= Article.new(timothy,forbes,"new pandemic looms")
art3= Article.new(jim,playboy,"meet the hottest man alive")
art4= Article.new(timothy,forbes, "why education is not important enough")

timothy.add_article(outlook,"unga prices to continue rising")
james.add_article(forbes,"smart ways to save money")
jim.add_article(playboy,"casting calls")

pp Magazine.all
pp Article.all
puts james.topic_areas
puts james.magazines
puts james.articles

pp Magazine.find_by_name("playboy")
pp playboy.article_titles
pp forbes.contributing_authors





### DO NOT REMOVE THIS
binding.pry

0
