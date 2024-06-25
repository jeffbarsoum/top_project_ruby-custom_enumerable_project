module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    my_each do |enum|
      yield(enum, i)
      i += 1
      nil
    end
  end

  def my_select
    result = []
    my_each do |enum|
      result.push enum if yield(enum)
    end
    result
  end

  def my_all?
    result = false
    my_each do |enum|
      result = yield(enum)
      return result unless result
    end
    result
  end

  def my_any?
    result = false
    my_each do |enum|
      result = yield(enum)
      return result if result
    end
    result
  end

  def my_none?
    result = false
    my_each do |enum|
      result = yield(enum)
      break if result
    end
    !result
  end

  def my_count
    i = 0
    my_each do |enum|
      case block_given?
      when true
        i += 1 if yield(enum)
      else
        i += 1
      end
    end
    i
  end

  def my_map(&block)
    result = []
    my_each do |enum|
      result << block.call(enum) if block_given?
    end
    result
  end

  def my_inject(accumulator = nil, &block)
    result = accumulator || 0
    my_each do |enum|
      result = block.call(result, enum)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    each(&block)
  end
end
