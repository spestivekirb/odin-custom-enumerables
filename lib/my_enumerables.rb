module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    
    i = 0
    while i < self.length
      yield(self[i], i)
      i+= 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    selected = []
    self.my_each do |i|
      selected.append(i) if yield i
    end
    selected
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    self.my_each do |i|
      return false unless yield i
    end
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    self.my_each do |i|
      return true if yield i
    end
    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    self.my_each do |i|
      return false if yield i 
    end
    true
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end
