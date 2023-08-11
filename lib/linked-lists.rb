class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head

  def initialize(node = nil)
    @head = node
  end

  def append(value)
    current = @head
    current = current.next_node until current.next_node.nil?
    current.next_node = Node.new(value)
  end

  def prepend(value)
    new_head = Node.new(value)
    new_head.next_node = @head
    @head = new_head
  end

  def size
    current = @head
    count = current.nil? ? 0 : 1
    until current.next_node.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  def tail
    return nil if @head.nil?

    current = @head
    loop do
      break if current.next_node.nil?

      current = current.next_node
    end
    current
  end

  def at(index)
    return nil if @head.nil? || index > size - 1

    current = @head
    i = 0
    loop do
      break if current.next_node.nil? || i == index
      current = current.next_node
      i += 1
    end
    current.value
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      removed = @head
      @next_node = nil
      return removed
    end

    current = @head
    loop do
      break if current.next_node.next_node.nil?
      current = current.next_node
    end
    removed = current.next_node
    current.next_node = nil
    removed
  end

  def contains?(value)
    current = @head
    until current.nil?
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    i = 0
    until current.nil?
      return i if current.value == value
      current = current.next_node
      i += 1
    end
    nil
  end

  def to_s
    str = ''
    current = @head
    until current.nil?
      current.value.nil? ? str << '( nil ) -> ' : str << "( #{current.value} ) -> "
      current = current.next_node
    end
    str << 'nil'
  end

  def insert_at(value, index)
    if @head.nil?
      @head = Node.new(value)
      return
    end

    if index.zero?
      node = Node.new(value)
      node.next_node = @head
      @head = node
      return
    end

    previous = current = @head
    i = 0

    loop do
      break if index == i

      append(nil) if current.next_node.nil?

      previous = current
      current = current.next_node
      i += 1
    end
    node = Node.new(value)
    previous.next_node = node
    node.next_node = current
  end

  def remove_at(index)
    return nil if @head.nil? || index > size - 1

    if index.zero?
      removed = @head
      @head = @head.next_node
      return removed
    end

    previous = current = @head
    i = 0
    loop do
      break if current.next_node.nil? || i == index

      previous = current
      current = current.next_node
      i += 1
    end
    if current.next_node.nil?
      removed = nil
    else
      removed = current.next_node
      previous.next_node = current.next_node
    end
    removed
  end
end

# tests
test = LinkedList.new(Node.new('original node'))

puts test

puts "\nappend test1"
test.append('test1')

puts 'append test2'
test.append('test2')

puts 'append test3'
test.append('test3')

puts "\n#{test}"

puts "\n  head:   #{test.head.value}"
puts "  tail:   #{test.tail.value}"
puts "  size: #{test.size}"
puts "\n  contains? test3:   #{test.contains?('test3')}"
puts "  contains? test5:   #{test.contains?('test5')}"

print "\n  find test3:   "
p test.find('test3')
print "  find test5:   "
p test.find('test5')

puts "\npop"
test.pop

puts 'append post-pop'
test.append('post-pop')

puts 'prepend prepend-test'
test.prepend('prepend-test')

puts 'append append-test'
test.append('append-test')

puts "\n#{test}"

puts "\n  at 0:   #{test.at(0)}"
puts "  at 2:   #{test.at(2)}"

puts "\ninsert inserted-node at 2"
test.insert_at('inserted-node', 2)
puts "\n#{test}"

puts "\nremove test1 at 3"
test.remove_at(3)
puts "\n#{test}"
