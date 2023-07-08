
module All
    def all
        ObjectSpace.each_object(self).to_a
      end
end