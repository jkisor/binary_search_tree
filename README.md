binary_search_tree
==================
This is an exercise to implement a Binary Search Tree using Test Driven Development. There was also a function on the 'Single Responsibility Principle' as I wanted to try avoiding the common way of implementing all the tree behaviors in the 'TreeNode' class.

A note about the high level tests:

'spec/binary_search_tree_spec.rb' contains the 'integration' type tests and uses a funny format for assertion. As a tree is difficult to assert as a whole, I'm using a 'to_a' (to array) function that looks like so:
[root, [left child, [],[]], [right child, [],[]]]

This strangeness is ok as this is just to ensure that all the peices are working together correctly. You can find more specific/more digestable unit tests elsewhere (NodeInserter, NodeRemover).
