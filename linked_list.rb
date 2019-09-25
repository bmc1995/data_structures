class Node
  
  attr_accessor :value, :next  
  
  def initialize(value)
    @value = value
    @next = nil
  end

end


class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  def tail
    selector = @head
    while selector.next
      selector = selector.next
    end
    selector
  end

  def append(value)
    old_head = @head

    if @head
      @head = Node.new(value)
      @head.next = old_head
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    self.tail.next = Node.new(value)
  end

  def size
    selector = @head
    i=0
    while selector.next
      selector = selector.next
      i+=1
    end
    i+1
  end

  def at(index)
    selector = @head
    i=0
    while i != index
      selector = selector.next
      i+=1
    end
    selector
  end

  def pop
    self.at(size-2).next = nil
  end
  
  def contains?(val)
    selector = @head
    c = false
    while selector != nil
      c = true if selector.value == val
      selector = selector.next
    end
    c
  end

  def find(data)
    selector = @head
    i=0
    while selector.next && selector.value != data
      selector = selector.next
      i+=1
    end
    selector.value == data ? i : nil
  end

  def to_s
    selector = @head
    i=0
    s = "( #{selector.value} )"
    while selector != nil
      selector = selector.next 
      selector.nil? ? s += " -> nil": s += " -> ( #{selector.value} )" 
      i+=1
    end
    s
  end

end



a = LinkedList.new
a.append(1)
a.append(2)
a.append(3)
a.append(4)
a.append(5)
