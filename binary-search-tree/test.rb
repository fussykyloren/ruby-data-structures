require_relative "tree.rb"

tree = Tree.new(Array.new(15) { rand(1..100) })

while !tree.balanced?
  tree = Tree.new(Array.new(15) { rand(1..100) })
  tree.rebalance!
end

puts "Is the Tree Balanced?: #{tree.balanced?}"
puts "\n"

puts "The Tree in Level Order is: "
tree.level_order { |node| print "#{node} -> " }
puts "\n"
puts "The Tree in In Order is: "
tree.inorder { |node| print "#{node} -> " }
puts "\n"
puts "The Tree in Pre Order is: "
tree.preorder { |node| print "#{node} -> " }
puts "\n"
puts "The Tree in Post Order is: "
tree.postorder { |node| print "#{node} -> " }
puts "\n\n"
puts "The Tree Depth is: #{tree.depth}"
puts "\n"
puts "Is the Tree Balanced?: #{tree.balanced?}"

test_array = Array.new(5) { rand(100..200) }

test_array.each { |number| tree.insert(number) }

while tree.balanced?
  test_array.each { |number| tree.delete(number) }
  test_array = Array.new(5) { rand(100..200) }
  test_array.each { |number| tree.insert(number) }
end

puts "\n"
puts "We have added 5 numbers to the array and unbalanced the tree"
puts "Is the Tree Balanced?: #{tree.balanced?}"
puts "\n"
tree.rebalance!
puts "Is the Tree Balanced?: #{tree.balanced?}"
puts "\n"

puts "The Tree in Level Order is: "
tree.level_order { |node| print "#{node} -> " }
puts "\n"
puts "The Tree in In Order is: "
tree.inorder { |node| print "#{node} -> " }
puts "\n"
puts "The Tree in Pre Order is: "
tree.preorder { |node| print "#{node} -> " }
puts "\n"
puts "The Tree in Post Order is: "
tree.postorder { |node| print "#{node} -> " }
puts "\n\n"
puts "The Tree Depth is: #{tree.depth}"
puts "\n"
puts "Is the Tree Balanced?: #{tree.balanced?}"