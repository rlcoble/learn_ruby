class BinaryTree
	def initialize(values)
		@values = values
		@root = nil
		build_tree
	end

	def build_tree
		@root = Node.new(@values[0])
		@values.each_with_index do |value,i|
			next if i == 0
			node_init(value)
		end
	end

	def node_init(value, node = @root)
		if value<=node.value && node.l_child.nil?
			node.l_child = Node.new(value)
			node.l_child.parent = node
		elsif value>node.value && node.r_child.nil?
			node.r_child = Node.new(value)
			node.r_child.parent = node
		elsif value<=node.value && !node.l_child.nil?
			node_init(value,node.l_child)
		elsif value>node.value && !node.r_child.nil?
			node_init(value,node.r_child)
		end
	end

	def bfs(value)
		queue = [@root]
		queue.each do |node|
			return node if value == node.value
			queue << node.l_child if !node.l_child.nil?
			queue << node.r_child if !node.r_child.nil?
		end
		return nil
	end

	def dfs(value, node = @root)
		return node if value == node.value
		tmp = dfs(value, node.l_child) if !node.l_child.nil?
		return tmp if !tmp.nil?
		tmp = dfs(value, node.r_child) if !node.r_child.nil?
		return tmp if !tmp.nil?
		return nil
	end

	def print_node(node)
		print "Value: #{node.value}"
		print ", Parent: #{node.parent.value}" if !node.parent.nil?
		puts ""
	end

	def print_tree(node = @root)
		if node.l_child.nil? && node.r_child.nil?
			print_node(node)
			return
		end

		if !node.l_child.nil?
			print "Value: #{node.value}, Left Child: #{node.l_child.value}"
			print ", Parent: #{node.parent.value}" if !node.parent.nil?
			puts ""
			print_tree (node.l_child)
		end

		if !node.r_child.nil?
			print "Value: #{node.value}, Right Child: #{node.r_child.value}"
			print ", Parent: #{node.parent.value}" if !node.parent.nil?
			puts ""
			print_tree (node.r_child)
		end
		puts ""
	end
end

class Node
	attr_reader :value
	attr_accessor :parent, :l_child, :r_child
	def initialize(value)
		@value = value
	end
end


bt = BinaryTree.new([7, 1, 23, 8, 4, 3, 5, 9, 67, 6345, 324])
bt.print_tree
puts "BFS SEARCH"
bt.print_node(bt.bfs(6345))
puts ""
puts "DFS SEARCH"
bt.print_node(bt.dfs(6345))