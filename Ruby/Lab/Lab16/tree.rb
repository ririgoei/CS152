class Tree
  attr_accessor :value, :leftNode, :rightNode
  def initialize(value, leftNode=nil, rightNode=nil)
    @value = value
    @leftNode = leftNode
    @rightNode = rightNode
  end

def each_node(&block)
  yield @value
  if @leftNode != nil
    @leftNode.each_node(&block)
  end
  if @rightNode != nil
    @rightNode.each_node(&block)
  end

end

  def method_missing(m)
    if m.to_s.length<=0
      return @value
    end

    if m.to_s =~ /^left/
      if m.to_s.length<5
        return @leftNode.value
      end

      @leftNode.method_missing(m.to_s.slice(m.to_s.index("t")+2 , m.to_s.length))
    elsif m.to_s =~ /^right/
      if m.to_s.length<6
        return @rightNode.value
      end
       @rightNode.method_missing(m.to_s.slice(m.to_s.index("t")+2 , m.to_s.length))
    end
  end

end

my_tree = Tree.new(42,
                   Tree.new(3,
                            Tree.new(1,
                                     Tree.new(7,
                                              Tree.new(22),
                                              Tree.new(123)),
                                     Tree.new(32))),
                   Tree.new(99,
                            Tree.new(81)))

my_tree.each_node do |v|
   puts v
end

arr = []
my_tree.each_node do |v|
   arr.push v
end
p arr

p "Getting nodes from tree"
p my_tree.left
p my_tree.left_left
p my_tree.left_left_left
p my_tree.left_left_left_left
p my_tree.right
p my_tree.right_left
