class CustomStack

  =begin
      :type max_size: Integer
  =end
      def initialize(max_size)
        @array = Array.new
        @size = 0
        @max_size = max_size
      end


  =begin
      :type x: Integer
      :rtype: Void
  =end
      def push(x)
        if @size < @max_size
          @array[@size] = x
          @size += 1
        end
      end


  =begin
      :rtype: Integer
  =end
      def pop()
        return -1 if @size <= 0

        result = @array[@size-1]
        @size -= 1
        return result
      end


  =begin
      :type k: Integer
      :type val: Integer
      :rtype: Void
  =end
      def increment(k, val)
        for i in 0..[k, @size].min-1
          @array[i] += val
        end
      end


  end

  # Your CustomStack object will be instantiated and called as such:
  # obj = CustomStack.new(max_size)
  # obj.push(x)
  # param_2 = obj.pop()
  # obj.increment(k, val)
