module Post
  module Comment
    def self.add(a,b)
      c=a+b
      return c
    end
  end

end
module Common
  def display
    puts 'khamar'
  end
end

class A
  extend Common
end

class B
  extend Common
end

class C
  extend Common
end

