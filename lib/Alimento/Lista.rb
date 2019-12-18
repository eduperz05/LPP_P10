class Error < StandardError; end

module Alimento

  Nodo = Struct.new(:value, :next, :prev)

  class Lista
	
    include Enumerable
    include Comparable
    attr_reader :head, :tail


    def initialize(*values)
      @head = Nodo.new(nil, nil, nil)
      @tail = @head

      if values != nil
        values.each { |value| unshift(value) }
      end

    end

    def empty
      @head.value == nil
    end

    def size
      if empty
        0
      elsif head == tail && head.value != nil
        1
      else
        i = 1
        aux = @head
        while aux != @tail
          i += 1
          aux = aux.next
        end
        i
      end
    end

    def size
      if empty
        0
      elsif head == tail && head.value != nil
        1
      else
        i = 1
        aux = @head
        while aux != @tail
          i += 1
          aux = aux.next
        end
        i
      end
    end

    def unshift(value)
      if empty
        @head.value = value
      elsif size == 1
        @tail = Nodo.new(value, nil, @head)
        @head.next = @tail
      else
        aux = Nodo.new(@tail.value, nil, @tail.prev)
        pre_tail = @tail.prev
        @tail = Nodo.new(value, nil, aux)
        aux.next = @tail
        pre_tail.next = aux
      end
    end

    def <<(value)
      unshift(value)
    end

    def first
      @head.value
    end

    def last
      @tail.value
    end

    def <=>(algo)
    end

    def each
	aux = @head
	while(aux != nil)
		yield aux.value
		aux = aux.next
	end
    end

  end
end
