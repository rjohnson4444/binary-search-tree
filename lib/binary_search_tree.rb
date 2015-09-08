class NullNode
  DEFAULT = NullNode.new  # => #<NullNode:0x007f8af2084e98>
end                       # => #<NullNode:0x007f8af2084e98>

class Node
  attr_accessor :data, :right, :left                                     # => nil
  def initialize(data, right=NullNode::DEFAULT, left=NullNode::DEFAULT)
    self.data = data                                                     # => "d", "b", "f", "e", "g", "c"
    self.right = right                                                   # => #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>
    self.left = left                                                     # => #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>, #<NullNode:0x007f8af2084e98>
  end                                                                    # => :initialize
end                                                                      # => :initialize

class Bst < Node                          # => Node
  attr_accessor :head                     # => nil
  def initialize(head=NullNode::DEFAULT)
    self.head = head                      # => #<NullNode:0x007f8af2084e98>
  end                                     # => :initialize

  def insert(value)
    self.head = insert_node(self.head, value)  # => #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, #<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, #<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, #<Node:0x007f8af207f240 @data="d", ...
  end                                          # => :insert

  def insert_node(current_node, data)
    if current_node == NullNode::DEFAULT                          # => true, false, true, false, true, false, false, true, false, false, true, false, false, true
      current_node = Node.new(data)                               # => #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af114e050 @data="c", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>
    elsif data < current_node.data                                # => true, false, false, true, false, false, true, false
      current_node.left = insert_node(current_node.left, data)    # => #<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207d300 @data="b", @right=#<Node:0x007f8af114e050 @data="c", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<NullNode:0x007f8af2084e98>>
    elsif data > current_node.data                                # => true, true, true, true, true
      current_node.right = insert_node(current_node.right, data)  # => #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, #<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2076d20 @data="f", @right=#<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, #<Node:0x007f8af114e050 @data="c", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>
    elsif data == current_node.data
      current_node.data = data
    end                                                           # => #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullN...
    current_node                                                  # => #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, #<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, #<Node:0x007f8af2076d20 @data="f", ...
  end                                                             # => :insert_node
end                                                               # => :insert_node




bst = Bst.new    # => #<Bst:0x007f8af207f998 @head=#<NullNode:0x007f8af2084e98>>
bst.insert("d")  # => #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>
bst              # => #<Bst:0x007f8af207f998 @head=#<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>
bst.insert("b")  # => #<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>
bst              # => #<Bst:0x007f8af207f998 @head=#<Node:0x007f8af207f240 @data="d", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>>
bst.insert("f")  # => #<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>
bst.head.right   # => #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>
bst.head.left    # => #<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>
bst              # => #<Bst:0x007f8af207f998 @head=#<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>>
bst.insert("e")  # => #<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>
bst.head.right   # => #<Node:0x007f8af2076d20 @data="f", @right=#<NullNode:0x007f8af2084e98>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>
bst.head.left    # => #<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>
bst.insert("g")  # => #<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>
bst              # => #<Bst:0x007f8af207f998 @head=#<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>>
bst.insert("c")  # => #<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<Node:0x007f8af114e050 @data="c", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<NullNode:0x007f8af2084e98>>>
bst.head.right   # => #<Node:0x007f8af2076d20 @data="f", @right=#<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>
bst.head.left    # => #<Node:0x007f8af207d300 @data="b", @right=#<Node:0x007f8af114e050 @data="c", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<NullNode:0x007f8af2084e98>>
bst              # => #<Bst:0x007f8af207f998 @head=#<Node:0x007f8af207f240 @data="d", @right=#<Node:0x007f8af2076d20 @data="f", @right=#<Node:0x007f8af2066718 @data="g", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<Node:0x007f8af206f688 @data="e", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>>, @left=#<Node:0x007f8af207d300 @data="b", @right=#<Node:0x007f8af114e050 @data="c", @right=#<NullNode:0x007f8af2084e98>, @left=#<NullNode:0x007f8af2084e98>>, @left=#<NullNode:0x007f8af2084e98>>>>
