# Nodos utilizados para los alimentos
Nodo=Struct.new :value,:next,:prev

# Clase lista
# @author Óscar González García
class Lista

include Enumerable
attr_reader :size, :head, :tail

  # Initialize de la clase Lista
  def initialize
    @size=0
    @head=@tail=nil
  end

  # Getter del tamaño
  #
  # @return [Integrer] Tamaño de la lista
  def size
    @size
  end

  # Getter de la cabeza
  #
  # @return [Nodp] Nodo de la cabeza
  def head
    @head
  end

  # Getter de la cola
  #
  # @return [Nodo] Nodo de la cola
  def tail
    @tail
  end

  # Insertar valor en la lista
  #
  #@param value Valor a insertar en la lista
  def insert(value)
    nodo=Nodo.new(value)
    @head=nodo if @head.nil?
    @tail.next=nodo unless @tail.nil?
    nodo.prev=@tail unless @tail.nil?
    @tail=nodo
    @size+=1
  end

  # Eliminar valor de la lista por la cabeza
  def pop_front
    if @size==1
      @head=nil
      a=@tail
      @tail=nil
      @size-=1
      return a.value
    elsif !@head.nil?
      @head.next.prev=nil
      a=@head
      @head=a.next
      a.next=nil
      @size-=1
      if @size==1
        @head=@tail
      end
      return a.value
    end
  end

  # Eliminar valor de la lista por la cola
  def pop_back
    if @size==1
      @tail=nil
      @head=nil
      return a.value
      @size-=1
    elsif !@tail.nil?
      @tail.prev.next=nil
      a=@tail
      @tail=a.prev
      a.prev=nil
      return a.value
      @size-=1
      if @size==1
        @head=@tail
      end
    end
  end

  # Definicion de "each" de Enumerable
  def each
    node=@head
    while node!=nil do
      yield node.value
      node=node.next
    end
  end

end
