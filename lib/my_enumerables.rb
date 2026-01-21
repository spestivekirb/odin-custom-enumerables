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

  def my_count
    return self.length unless block_given?
    total = 0
    self.my_each do |i|
      total += 1 if yield i
    end
    total
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    mapped = []
    self.my_each do |i|
      mapped.append(yield i)
    end
    mapped
  end

  def my_inject(acc = nil)
    return to_enum(:my_inject) unless block_given?
    copy = self.to_a
    acc = copy.shift if acc == nil
    self.my_each do |i|
      acc = yield(acc, i)
    end
    acc
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
