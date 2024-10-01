
#class TreeNode
  #     attr_accessor :val, :left, :right
  #     def initialize(val = 0, left = nil, right = nil)
  #         @val = val
  #         @left = left
  #         @right = right
  #     end
  # end
def invert_tree(root)
  return root if( root ==nil) 
  left_node= invert_tree(root.left)
  right_node=invert_tree(root.right)
  root.left=right_node
  root.right=left_node
  return root
end