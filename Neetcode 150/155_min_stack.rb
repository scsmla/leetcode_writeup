class MinStack
  def initialize()
    @head = nil
  end

=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
    if @head.nil?
      @head = Node.new(val, val, nil)
    else
      @head = Node.new(val, [@head.min, val].min, @head)
    end
  end


=begin
  :rtype: Void
=end
  def pop()
    @head = @head.nex
  end


=begin
  :rtype: Integer
=end
  def top()
    @head.val
  end


=begin
  :rtype: Integer
=end
  def get_min()
    @head.min
  end


end

class Node
attr_accessor :val, :min, :nex

def initialize(val, min, nex)
  self.val = val
  self.min = min
  self.nex = nex
end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()
#
# Node
# val
# min
# next
