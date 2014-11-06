require 'question/simple_choice'
require "question/simple_choice/version"

Node = Struct.new(:thevalue, :thenext, :theprev)

class List
  attr_accessor :head :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def lpush(other)
    if @head == nil
      @head = other
      @tail = other
    else
     other.thenext = @head
     @head.theprev = other
     other.theprev = nil
     @head = other 
    end
  end

  def lpop
    if(@head != @tail) # Hay más de un elemento en la lista
      aux = @head
      @head = @head.thenext
      @head.theprev = nil
      aux.thevalue
    else (@head ==  @tail) && (@head != nil) # Hay un solo elemento en la lista
      aux = @head
      @head = nil
      @tail = nil
      aux.thevalue
    else
      puts "No hay elementos en la lista"
    end
  end
end