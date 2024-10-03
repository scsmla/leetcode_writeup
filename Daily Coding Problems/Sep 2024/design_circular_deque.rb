class MyCircularDeque

  =begin
      :type k: Integer
  =end
      def initialize(k)
        @array = Array.new
        @limit = k
      end


  =begin
      :type value: Integer
      :rtype: Boolean
  =end
      def insert_front(value)
        return false if @array.length >= @limit
        @array.unshift(value)
        return true
      end


  =begin
      :type value: Integer
      :rtype: Boolean
  =end
      def insert_last(value)
        return false if @array.length >= @limit
        @array.push(value)
        return true
      end


  =begin
      :rtype: Boolean
  =end
      def delete_front()
        return false if @array[0].nil?
        @array.shift
        return true
      end


  =begin
      :rtype: Boolean
  =end
      def delete_last()
        return false if @array[-1].nil?
        @array.pop
        return true
      end


  =begin
      :rtype: Integer
  =end
      def get_front()
        return -1 if @array.empty?
        @array[0]
      end


  =begin
      :rtype: Integer
  =end
      def get_rear()
        return -1 if @array.empty?
        @array[-1]
      end


  =begin
      :rtype: Boolean
  =end
      def is_empty()
        @array.empty?
      end


  =begin
      :rtype: Boolean
  =end
      def is_full()
        @array.length >= @limit
      end


  end

  # Your MyCircularDeque object will be instantiated and called as such:
  # obj = MyCircularDeque.new(k)
  # param_1 = obj.insert_front(value)
  # param_2 = obj.insert_last(value)
  # param_3 = obj.delete_front()
  # param_4 = obj.delete_last()
  # param_5 = obj.get_front()
  # param_6 = obj.get_rear()
  # param_7 = obj.is_empty()
  # param_8 = obj.is_full()
