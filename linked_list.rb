class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end

  def append(val)
    node = Node.new(val)

    if empty?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(val)
    node = Node.new(val)

    if empty?
      append(val)
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    return puts 0 if empty?

    node = @head
    count = 1
    until node == @tail
      node = node.next_node
      count += 1
    end
    count
  end

  def head
    puts @head.value
  end

  def tail
    puts @tail.value
  end

  def each
    node = @head

    loop do
      break unless node

      yield node
      node = node.next_node
    end
  end

  def at(index)
    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    return if empty?

    second_last = @head
    while second_last.next_node.next_node
      second_last = second_last.next_node
    end
    second_last.next_node = nil
    @head
  end

  def contains?(val)
    node = @head

    until node.nil?
      return true if node.value == val

      node = node.next_node
    end
    false
  end

  def find(val)
    node = @head
    shifts = 0

    until node.nil?
      return shifts if node.value == val

      node = node.next_node
      shifts += 1
    end
    'Not in list'
  end

  def to_s(node = @head)
    until node.nil?
      if node == @tail
        print "( #{node.value} ) "
      else
        print "( #{node.value} ) -> "
      end
      node = node.next_node
    end
  end

  def insert_at(val, index)
    return 'index bigger than list' if index > size

    if index.zero?
      prepend(val)
    else
      new_node = Node.new(val, at(index))
      prev_node = at(index - 1)
      prev_node.next_node = new_node
      @tail = new_node if new_node.next_node.nil?
    end
  end

  def remove_at(index)
    return 'index bigger than list' if index > size

    if index.zero?
      @head = at(1)
    elsif at(index) == @tail
      @tail = at(index - 1)
      @tail.next_node = nil
    else
      prev_node = at(index - 1)
      prev_node.next_node = at(index + 1)
    end
  end

  private

  def empty?
    @head.nil? && @tail.nil?
  end
end

test = LinkedList.new
test.append(66)
test.prepend(22)
test.append(44)
test.append(55)

puts test.remove_at(1)
test.each { |node| puts node.value }
