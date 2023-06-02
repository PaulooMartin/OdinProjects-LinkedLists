class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    last = Node.new
    last.value = value
    connect_with_last_node(last) unless @head.nil?

    if @head.nil?
      @head = last
    else
      @tail = last
    end
  end

  def prepend(value)
    first = Node.new
    first.value = value
    first.next_node = @head unless @head.nil?

    @tail = @head if @tail.nil? # !don't forget to check solutions on setting tail if user prepends on a head-only list
    @head = first
  end

  def size
    counter = 0
    current_node = @head
    until current_node.nil?
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def at(index)
    counter = 0
    current_node = @head
    while counter < index
      current_node = current_node.next_node
      counter += 1
    end
    current_node
  end

  def pop
    before_last = at(size - 2)
    before_last.next_node = nil
    popped = @tail
    @tail = before_last
    popped
  end

  def contains?(value)
    match = false
    current_node = @head

    until match || current_node.nil?
      match = true if current_node.value == value
      current_node = current_node.next_node
    end

    match
  end

  def find(value)
    counter = 0
    list_size = size
    index = nil
    current_node = @head
    while index.nil? && counter < list_size
      index = counter if current_node.value == value
      current_node = current_node.next_node
      counter += 1
    end
    index
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print " ( #{current_node.value.inspect} ) ->"
      current_node = current_node.next_node
    end
    puts ' nil'
  end

  private

  def connect_with_last_node(last_node)
    if @tail.nil?
      @head.next_node = last_node
    else
      @tail.next_node = last_node
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

list = LinkedList.new

[1, 2, 3, 4, 5, nil].each { |num| list.append(num) }

puts list
