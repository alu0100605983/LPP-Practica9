require 'question/simple_choice'
require "question/simple_choice/version"

Node = Struct.new(:thevalue, :thenext)

class List
  attr_accessor :head

  def initialize
    @head = nil
    @contador = 0
  end

  def lpush(other)
    if @head == nil
      @head = other
      @contador = @contador + 1;
    else
     other.thenext = @head.thevalue
     @head = other   
     @contador = @contador + 1;  
    end
    @head #retornamos el nodo cabeza
  end

  def lpop
    aux = @head
    @head = aux.thenext
    aux.thevalue #retorna el valor borrado
  end

end