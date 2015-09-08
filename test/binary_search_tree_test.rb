# First Pass:

# if head node is null, make a node to take the head node position

# Second Pass:

# if head node has a node, compare the value of the head node
# to the value of the newly made node.
#   if newly made node is LARGER than the head node,
#   place node in the right position of the head node.

#

#

require 'binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_inserts_first_node_as_head
    bst = Bst.new
    bst.insert("d")
    assert_equal "d", bst.head.data
  end

  def test_has_a_node_with_a_value
    node = Node.new("b")
    assert_equal "b", node.data
  end

  def test_the_big_picture_works
    bst = Bst.new
                bst.insert("d")
                  bst.insert("b")
                    bst.insert("a")
                    bst.insert("c")
                  bst.insert("f")
                    bst.insert("e")
                    bst.insert("g")

      assert_equal bst.head.data, "d"
      assert_equal bst.head.left.data, "b"
      assert_equal bst.head.right.data, "f"
      assert_equal bst.head.left.right.data, "c"
      assert_equal bst.head.right.left.data, "e"
      assert_equal bst.head.right.right.data, "g"
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

    def test_inserts_two_nodes_in_succession_on_left_branch
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      bst.insert("a")
      assert_equal "a", bst.head.left.left.data
    end

    def test_inserts_two_nodes_in_succession_on_right_branch
      bst = Bst.new
      bst.insert("d")
      bst.insert("f")
      bst.insert("g")
      assert_equal "g", bst.head.right.right.data
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

    def test_deletes_a_node_from_tree_of_3_or_more_nodes
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      bst.insert("c")
      bst.insert("f")
      bst.delete("f")
      assert_equal NullNode::DEFAULT, bst.head.right
    end

    def test_deletes_1_node_from_tree
      bst = Bst.new
      bst.insert("d")
      assert_equal NullNode::DEFAULT, bst.delete("d")
    end

    def test_sort_node_values_in_array_in_assending_order
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      bst.insert("c")
      bst.insert("f")
      bst.insert("a")
      assert_equal ["a", "b", "c", "d", "f"], bst.sort
    end

    def test_retrieve_minimum_value_in_tree_of_2_values
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      assert_equal "b", bst.minimum
    end

    def test_retrieve_minimum_value_in_tree_of_more_than_3_values
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      bst.insert("c")
      bst.insert("f")
      bst.insert("a")
      assert_equal "a", bst.minimum
    end

    def test_retrieves_maximum_value_in_tree_of_2_values
      bst = Bst.new
      bst.insert("d")
      bst.insert("a")
      assert_equal "d", bst.maximum
    end

    def test_retrieves_maximum_value_in_tree_of_3_or_more_values
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      bst.insert("c")
      bst.insert("f")
      bst.insert("a")
      assert_equal "f", bst.maximum
    end

    def test_counts_depth_of_tree_for_2_nodes
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      assert_equal 2, bst.tree_depth
    end

    def test_counts_number_of_nodes_in_the_tree_with_2_values
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      assert_equal 2, bst.node_count
    end

    def test_counts_number_of_nodes_in_a_tree_of_3_or_more_nodes
      bst = Bst.new
      bst.insert("d")
      bst.insert("b")
      bst.insert("c")
      bst.insert("f")
      bst.insert("a")
      assert_equal 5, bst.node_count
    end
  end
