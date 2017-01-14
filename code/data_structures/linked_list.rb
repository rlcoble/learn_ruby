class LinkedList
	def initialize
		@head = nil
		@tail = nil
		@last_node = nil
		@node_size = 0
	end

	def append(val)
		new_node = Node.new(val)
		@node_size += 1

		if @head.nil?
			@head = @tail = @last_node = new_node
		else
			@last_node.next_node = @tail = new_node
			@last_node = new_node
		end
	end

	def prepend(val)
		new_node = Node.new(val)
		@node_size +=1

		if @head.nil?
			@head = @tail = @last_node = new_node
		else
			new_node.next_node = @head
			@head = new_node
		end
	end

	def size
		@node_size
	end

	def head
		@head.value
	end

	def tail
		@tail.value
	end

	def at(index)
		return "ERROR" if ((index >= @node_size) || (index<0))
		node = @head
		0.upto(index-1){|i| node = node.next_node}
		node
	end

	def pop
		@tail = @last_node = node = at(@node_size - 2)
		@node_size -= 1
		node.next_node = nil
	end

	def contains?(val)
		if @head.nil?
			return false
		else
			node = @head
			@node_size.times do |i|
				return true if node.value == val
				node = node.next_node
			end
		end
		false
	end

	def find(val)
		return nil if @head.nil?
		node = @head
		0.upto(@node_size - 1) do |i| 
			return i if node.value == val
			node = node.next_node
		end
		return nil
	end

	def to_s
		return "" if @head.nil?
		node = @head
		@node_size.times do
			print "( #{node.value} ) -> "
			node = node.next_node
		end
		puts ""
	end

	def insert_at(index, val)
		return "ERROR" if ((index > @node_size) || (index<0))
		new_node = Node.new(val)
		node = @head
		if index == 0
			new_node.next_node = @head
			@head = new_node
		elsif index == @node_size
			@tail.next_node = new_node
			@tail = @last_node = new_node
		else
			before_node = at(index-1)
			after_node = at(index)
			new_node.next_node = after_node
			before_node.next_node = new_node
		end
		@node_size += 1
	end

	def remove_at(index)
		return "ERROR" if ((index >= @node_size) || (index<0))
		node = @head
		skip_node = nil

		node = at(index)
		skip_node = at(index-1)

		if index == 0
			@head = @head.next_node
		elsif index == (@node_size - 1)
			@tail = @last_node = skip_node
			skip_node.next_node = nil
		else
			skip_node.next_node = node.next_node
		end
		node.next_node = nil
		@node_size -= 1
	end
end

class Node
	attr_accessor :value, :next_node
	def initialize(value)
		@value = value
		@next_node = nil
	end
end

ll = LinkedList.new
0.upto(4){|i| ll.append(i)}
#ll.to_s
ll.prepend(5)
#ll.to_s
#puts "#{ll.size} nodes, #{ll.head} is the head, and #{ll.tail} is the tail"
node = ll.at(3)
#puts "#{node.value}"
ll.pop
#ll.to_s
#puts ll.contains?(4)
#puts ll.find(5)
ll.insert_at(1,4)
#ll.to_s
ll.remove_at(1)
#ll.to_s

