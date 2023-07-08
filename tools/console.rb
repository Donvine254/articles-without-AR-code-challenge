require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
timothy = Author.new("Timothy")
james = Author.new('James')
jim = Author.new('Jim')

outlook = Magazine.new("outlook","fashion")
forbes =Magazine.new("forbes","business")
playboy =Magazine.new("playboy","fashion")

art1= Article.new(james,outlook,"title_one")
art2= Article.new(timothy,forbes,"title_two")
art3= Article.new(jim,playboy,"title_three")
art4= Article.new(timothy,forbes, "title_four")

timothy.add_article(outlook,"title_three")
james.add_article(forbes,"title_four")
jim.add_article(playboy,"title_five")








### DO NOT REMOVE THIS
binding.pry

0
