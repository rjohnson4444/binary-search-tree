class NullNode
  DEFAULT = NullNode.new
end

class Node
  attr_accessor :data, :right, :left, :node_count
  def initialize(data, right=NullNode::DEFAULT, left=NullNode::DEFAULT)
    self.data = data
    self.right = right
    self.left = left
  end

  def <=>(other_node)
    self.data <=> other_node.data
  end
end

class Bst < Node
  attr_accessor :head, :depth
  def initialize(head = NullNode::DEFAULT)
    self.head = head
    self.node_count = 0
    self.depth = 1
  end

  def tree_depth
    self.depth
  end

  def insert(value)
    self.head = insert_node(self.head, value)
  end

  def insert_node(current_node, data)
    if current_node == NullNode::DEFAULT
      self.node_count += 1
      self.depth += 1
      current_node = Node.new(data)
    elsif data < current_node.data
      current_node.left = insert_node(current_node.left, data)
    elsif data > current_node.data
      current_node.right = insert_node(current_node.right, data)
    end
    current_node
  end

  def maximum
    sorted = []
    maximum_value(sorted, self.head)
    sorted[0]
  end

  def maximum_value(list, node)
    null = NullNode::DEFAULT
    unless node == null
      maximum_value(list, node.right)
      list << node.data
      list
    end
  end

  def minimum
    sorted = []
    minimum_value(sorted, self.head)
    sorted[0]
  end

  def minimum_value(list, node)
    null = NullNode::DEFAULT
    unless node == null
      minimum_value(list, node.left)
      list << node.data
      list
    end
  end

  def sort
    sorted = []
    sorted_values(sorted, self.head)
    sorted
  end

  def sorted_values(list, node)
    null = NullNode::DEFAULT
    unless node == null
      sorted_values(list, node.left)
      list << node.data
      sorted_values(list, node.right)
    end
  end

  def include?(data)
    values = []
    include_values?(values, self.head)
    values.each do |value|
      if value == data
        return true
      else
        next
      end
    end
    false
  end

  def include_values?(list, node)
    null = NullNode::DEFAULT
    unless node == null
      include_values?(list, node.left)
      list << node.data
      include_values?(list, node.right)
    end
  end

  def delete(value)
    self.head = delete_node(self.head, Node.new(value))
  end

  # figure out how to avoid comparing a NullNode
  def delete_node(current_node, node)
    if current_node.data == node.data
      current_node = remove(current_node)
    elsif node.data < current_node.data
      current_node.left = delete_node(current_node.left, node)
    else
      current_node.right = delete_node(current_node.right, node)
    end
    return current_node
  end

  def remove(node)
    null = NullNode::DEFAULT
    if node.left == null && node.right == null
      self.depth -= 1
      node = null
    elsif node.left != null && node.right == null
      node.left = null
    elsif node.right == null && node.right != null
      node.right = null
    else
      node = replace_parent_node(node)
    end
  end

  def replace_parent_node(node)
    node.data = successor_data(node.right)
    node.right = update_node(node.right)
    node
  end

  def successor_data(node)
    unless node.left == NullNode::DEFAULT
      successor_data(node.left)
    end
    node.data
  end

  def update_node(node)
    unless node.left = NullNode::DEFAULT
      node.left = update_node(node)
    end
    node.right
  end
end
