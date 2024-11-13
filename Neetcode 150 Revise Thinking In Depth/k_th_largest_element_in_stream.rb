# Time complexity: O(nlogn)
# Space complexity: O(k)
class KthLargest

  =begin
      :type k: Integer
      :type nums: Integer[]
  =end
      def initialize(k, nums)
        @min_heap = MinHeap.new
        @k = k
        nums.each do |num|
          add(num)
        end
      end


  =begin
      :type val: Integer
      :rtype: Integer
  =end
      def add(val)
        if @min_heap.length < @k
          @min_heap.push(val)
        else
          if @min_heap.next < val
            @min_heap.pop
            @min_heap.push(val)
          end
        end

        @min_heap.next
      end
  end

  # Your KthLargest object will be instantiated and called as such:
  # obj = KthLargest.new(k, nums)
  # param_1 = obj.add(val)
