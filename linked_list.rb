class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :name, :list_size

  def initialize
    @head = nil
    @tail = nil
    @list_size = 0
  end
  # print bottom of que (append)
  def append(value) 
    node_entry = Node.new(value)
    if @head.nil?
      @head = node_entry
    elsif @tail.nil?
      @tail = node_entry
    else
      @tail.next_node = node_entry
    end
    @tail = node_entry
    @list_size += 1
  end
  # print top of que (prepend)
  def prepended(value)
    node_entry = Node.new(value, @head)
    @head = node_entry
    @list_size += 1
  end

  def size
    list_size
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return nil if list_size < 1

    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  def display_list
    current_node = @head
    finished = false

    until finished
      finished = true if current_node == @tail
      p current_node.value
      current_node = current_node.next_node
    end
  end

  def find(value)
    count = 0
    current_node = @head
    return true unless current_node.next_node

    until current_node.value == value
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def to_s
    current_node = @head

    until current_node.nil?
      if current_node == @tail
        print "( #{current_node.value} )"
      else
        print "( #{current_node.value} ) -> "
      end
      current_node = current_node.next_node
    end
  end

  def insert_at(value, index)
    return false if index > size

    if index.zero?
      ptq(value)
    else
      node_entry = Node.new(value, at(index))
      prev_node = at(index - 1)
      prev_node.next_node = node_entry
      @tail = node_entry if node_entry.next_node.nil?
    end
  end

  def remove_at(index)
    return false if index > size

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

  def head_node
    @head.value
  end

  def tail_node
    @tail.value
  end
end

list = LinkedList.new

list.append(22)
list.append(33)
list.append(44)
list.append(55)
# puts list.size
list.remove_at(0)

list.display_list
