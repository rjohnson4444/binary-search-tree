# First Pass:

# if head node is null, make a node to take the head node position

# Second Pass:

# if head node has a node, compare the value of the head node
# to the value of the newly made node.
#   if newly made node is LARGER than the head node,
# => place node in left positon of the head node.
#    otherwise,
#   place node in the right position of the head node.

#

#

require 'binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_the_big_picture_works
    skip
    bst = Bst.new.insert("d")
                  .insert("b")
                    .insert("a")
                    .insert("c")
                  .insert("f")
                    .insert("e")
                    .insert("g")

      assert_equal bst.insert("d").head, "d"
      assert_equal bst.insert("b").left.data, "b"
      assert_equal bst.insert("a").right.data, "a"
      assert_equal bst.insert("d").left.right.data, "d"
      assert_equal bst.insert("e").right.left.data, "e"
      assert_equal bst.insert("f").right.right.data, "f"
    end

    def test_has_a_node_with_a_value
      node = Node.new("b")
      assert_equal "b", node.data
    end

    def test_inserts_first_node_as_head
      bst = Bst.new
      bst.insert("d")
      assert_equal "d", bst.head.data
    end

    def test_inserts_two_nodes_in_correct_position
      bst = Bst.new
      bst.insert("d")
      bst.insert("a")
      assert_equal "a", bst.head.left.data
    end

    def test_inserts_three_nodes_in_correct_position
      bst = Bst.new
      bst.insert("d")
      bst.insert("a")
      bst.insert("e")
      assert_equal "e", bst.head.right.data
    end

    def test_inserts_two_nodes_in_succession
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      bst.insert("a")
      assert_equal "a", bst.head.left.left.data
    end

    def test_verify_or_reject_the_presence_of_a_value
      bst = Bst.new
      bst.insert("d")
      bst.insert("c")
      bst.insert("f")
      bst.insert("a")
      assert_equal true, bst.include?("f")
      assert_equal false, bst.include?("r")
    end
  end
