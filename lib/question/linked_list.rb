Node = Struct.new(:thevalue, :thenext, :theprev)

class List
  
  include Enumerable

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

class Exam
    
    include Comparable

    attr_accessor :question
    
    def initialize(question)
      @question = question
      raise ArgumentError, 'Specify :question' unless @question #retornamos el posible error o sino question
    end

    #Declaración función comparable que luego será heredada.
    def <=>(other)
    end

  end 

class TrueFalse < Exam
    
    attr_accessor :thetrue, :thefalse
    
    def initialize(question, thetrue, thefalse)
      
      super(question)
      
      @thetrue = thetrue
      raise ArgumentError, 'Specify :thetrue' unless @thetrue
      
      @thefalse = thefalse
      raise ArgumentError, 'Specify :thefalse' unless @thefalse
      
    end
    
    #Funcion Heredada y personalizada.
    def <=>(other)
      #@thetrue.size <=> other.thetrue.size #http://ruby-doc.org/core-2.1.4/Comparable.html
      @thetrue <=> other.thetrue #nil si no pueden ser comparados. -1 0 1
    end


    def to_s
      opcion = @thetrue+[@thefasle]
      s= "#{@question}\n"
      opcion.each do |opcion|
        s += %Q{#{opcion}\n}
      end
      s #enviar pregunta y respuestas
    end  
  end #fin de VerdaderoFalso
