class LinkedList
  def append(value)
    # adds a new node containing value to the end of the list
  end

  def prepend(value)
    # adds a new node containing value to the start of the list
  end

  def size
    # returns the total number of nodes in the list
  end

  def head
    # returns the first node in the list
  end

  def tail
    # returns the last node in the list
  end

  def at(index)
    # returns the node at the given index
  end

  def pop
    # removes the last element from the list
  end

  def contains?(value)
    # returns true if the passed in value is in the list
    # otherwise returns false
  end

  def find(value)
    # returns the index of the node containing velue,
    # if not found, returns nil
  end

  def to_s
    # represent your LinkedList objects as strings, so you
    # can print them out and preview them in the console.
    
    # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  end
end

class Node
  def value
    nil
  end

  def next_node
    nil
  end
end

