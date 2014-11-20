require 'question/simple_choice'
require "question/simple_choice.rb"
require "question/simple_choice/version"
require "question/linked_list.rb"


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

  def each

    aux = @head
    while aux != @tail do #recorremos la lista
      yield aux.thevalue #envia el bloque de cada valor
      aux=aux.thenext #anvanzamos
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
      #http://ruby-doc.org/core-2.1.4/Comparable.html
      @question <=> other.question #nil si no pueden ser comparados. -1 0 1
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

class Examen

  @p1=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juego \n", "a) Verdadero \n",
          "b) Falso \n") 
  @p2=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juego \n", "a) Verdadero \n",
          "b) Falso \n")
  @p3=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juegos \n", "a) Verdadero! \n",
          "b) False \n") 

   lista_exam = List.new()

   nodo_p1 = Node.new(@p1, nil, nil)
   nodo_p2 = Node.new(@p2, nil, nil)
   nodo_p3 = Node.new(@p3, nil, nil)

   lista_exam.lpush(nodo_p1)
   lista_exam.lpush(nodo_p2)
   lista_exam.lpush(nodo_p3)

   @n_preg = 1
   @n_fallos = 0
   @n_aciertos = 0

   lista_exam.each do |i|
    print "#{@n_pregunta})"    
    puts i.to_s
    print "Introduzca la respuesta: "
    STDOUT.flush
    respuesta = gets.chomp
    if respuesta == i.thetrue then
      print("La respuesta es correcta")
      @n_aciertos = @n_aciertos + 1
    else
      print("La respuesta es incorrecta")
      @n_fallos = @n_fallos + 1
    end
    #Siguiente pegunta
    @n_pregunta = n_pregunta + 1
  end #end each

end
