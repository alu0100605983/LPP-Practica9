require 'open-uri'

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
    while aux != nil do #recorremos la lista
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
class SimpleChoice < Exam
    attr_accessor :text, :right, :distractor
    
    def initialize(args)
      @text = args[:text]
      raise ArgumentError, 'Specify :text' unless @text
      @right = args[:right]
      raise ArgumentError, 'Specify :right' unless @right
      @distractor = args[:distractor]
      raise ArgumentError, 'Specify :distractor' unless @distractor
    end
    
    
    def to_html
      @options = @distractor+[@right]
      @options = @options.shuffle# baraja
      s = ' '
      @options.each do |options|
       s += %Q{<input type = "radio" value= "#{options}" name = 0 > #{options}\n}
      end
      botton = %Q{<input type="button" value="Enviar">}
      #html=<<-"HTML"
      "#{@text}<br/>\n#{s}\n#{botton}\n"
      #HTML
    end

    def mostrar_pregunta
        "#{@text}"
    end

     def mostrar_respuestas
        "#{@options}"
     end

     def to_s
      valor = @distractor+[@right]
      s= ' '
      valor.each do |valor|
        s += %Q{#{valor}\n}  
      end
      "#{@text}\n#{s}\n"
    end 

     def correcta(valor)
      if valor == @right
        return true
      else
        return false
      end
    end

     def <=> (other)
        @text <=> other.text 
     end
    
  end #simplechoice

#no se ejecutara desde un require solo de consola

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

    def correcta(valor)
      if valor == @thetrue
        return true
      else
        return false
      end
    end

    def to_s
      opcion = @thefalse+[@thetrue]
      s= ' '
      opcion.each do |opcion|
        s += %Q{#{opcion}\n}
      end
      "#{@question}\n#{s}\n"
    end  
  end #fin de VerdaderoFalso

class Vista
  attr_accessor :lista

  def initialize(lista)
    @lista = lista
  end

  def examinar
   @n_preg = 1
   @n_fallos = 0
   @n_aciertos = 0
    aux = @lista
    aux.each do |i|
      puts "----------------------------------"
      puts "#@n_preg .)"
      puts "#{i.to_s}\n"
      puts "Responda:"  
      STDOUT.flush  
      respuesta = gets.chomp
      if i.correcta(respuesta) == true
        puts "Respuesta Correcta"
        @n_aciertos += 1
      else
        puts "Respues Incorrecta"
        @n_fallos += 1
      end
      #puts "Siguiente Pregunta"
      @n_preg += 1
    end
  end

end

class Examen

  @p1=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juego", "Verdadero",
          ["Falso \n"])
  @p2=TrueFalse.new(
          "Salida class de hash_raro = {[1, 2, 3] => Object.new(),Hash.new => :toto}", "Verdadero",
          ["Falso \n"])
  @p3=TrueFalse.new(
          "¿Esto es un examen?", "Si", ["No"])
  @p4 = SimpleChoice.new(:text => '¿Cuanto es 2+5 ?', :right => "7", :distractor => [2,5,10])

   lista_exam = List.new()

   nodo_p1 = Node.new(@p1, nil, nil)
   nodo_p2 = Node.new(@p2, nil, nil)
   nodo_p3 = Node.new(@p3, nil, nil)
   nodo_p4 = Node.new(@p4, nil, nil)

   lista_exam.lpush(nodo_p1)
   lista_exam.lpush(nodo_p2)
   lista_exam.lpush(nodo_p3)
   lista_exam.lpush(nodo_p4)

   call = Vista.new(lista_exam)
   call.examinar

end

