require 'question/simple_choice'
require "question/simple_choice/version"

Node = Struct.new(:thevalue, :thenext, :theprev)

class List
  attr_accessor :head, :tail

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
    elsif (@head ==  @tail) && (@head != nil) # Hay un solo elemento en la lista
      aux = @head #variable creada para que al final retorne el valor del nodo eliminado
      @head = nil
      @tail = nil
      aux.thevalue
    else
      puts "No hay elementos en la lista"
    end
  end
end

class SimpleChoice
    
    attr_accessor :question
    
    def initialize(question)
      @question = question
      raise ArgumentError, 'Specify :question' unless @question #retornamos el posible error o sino question
    end

  end 

class TrueFalse < SimpleChoice
    
    attr_accessor :thetrue, :thefalse
    
    def initialize(question, thetrue, thefalse)
      
      super(question)
      
      @thetrue = thetrue
      raise ArgumentError, 'Specify :thetrue' unless @thetrue
      
      @thefalse = thefalse
      raise ArgumentError, 'Specify :thefalse' unless @thefalse
      
    end
    
    def to_s
      opcion = @thetrue+[@thefasle]
      s= ' '
      opcion.each do |opcion|
        s += %Q{#{opcion}\n}
      end
      "#{@question}\n#{s}\n" #enviar pregunta y respuestas
    end  
    
  end #fin de VerdaderoFalso
