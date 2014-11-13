require 'spec/spec_helper'
require 'question/simple_choice'
require 'question/linked_list'


    describe SimpleChoice do
       
      before :each do
        @p1 = SimpleChoice.new(:text => '¿Cuanto es 2+5 ?', :right => 7, :distractor => [2,5,10])
        @p2 = SimpleChoice.new(:text => '¿Cuanto es 2+5 ?', :right => 7, :distractor => [2,5,10])
        @p3 = SimpleChoice.new(:text => '¿Cuanto es 2+2+2 ?', :right => 7, :distractor => [2,5,10])
      end
      
      describe "Construccion de una pregunta" do

        it "Tiene pregunta" do
          expect(@p1.text) == '¿Cuanto es 2+5 ?'
        end

        it "Tiene respuesta correcta" do
          expect(@p1.right) == 7
        end

        it "Tiene otras respuestas" do
          expect(@p1.distractor) == [2,5,10]
        end

        it "Conversion html" do
          expect(@p1).to respond_to :to_html
        end

        it "Pertence a clase" do
          expect(@p1.class) == SimpleChoice
        end

        it "Probando comparacion igual" do
          expect(@p1 == @p2).to eq(true)    
        end  
        it "Probando comparacion distinto" do
          expect(@p2 == @p3).to eq(false)    
        end    
        it "Probando comparacion mayor" do
          expect(@p3 < @p2).to eq(true)    
        end
        it "Probando comparacion menor" do
          expect(@p3 > @p2).to eq(false)    
        end


      end
    end #describe SimpleChoice

 describe TrueFalse do   
    before :each do
        @p2=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juego \n", "a) Verdadero \n",
          "b) Falso \n") 
        @p3=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juego \n", "a) Verdadero \n",
          "b) Falso \n")
        @p4=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juegos \n", "a) Verdadero! \n",
          "b) False \n")          
    end   
    
    describe "Probando Clase True False" do
      it "Enuncia heredado" do
        expect(@p2.question) == 'Es apropiado que una clase Tablero herede de una clase Juego \n'         
      end
      it "Probando respuesta correcta" do
        expect(@p2.thetrue) == 'a) Verdadero \n'         
      end 
      it "Probando respuesta incorrecta" do
        expect(@p2.thefalse) == 'b) Falso \n'         
      end 
      it "Probando metodo to_s" do
        expect(@p2).to respond_to :to_s       
      end   
      it "Probando comparacion igual" do
        expect(@p2 == @p3).to eq(true)    
      end  
      it "Probando comparacion distinto" do
        expect(@p2 == @p4).to eq(false)    
      end    
      it "Probando comparacion mayor" do
        expect(@p4 > @p2).to eq(true)    
      end
      it "Probando comparacion menor" do
        expect(@p4 < @p2).to eq(false)    
      end
    end     
  end
    

  describe List do   
    before :each do
        @lista = List.new()
        @nodo1 = Node.new(@p1, nil, nil)
        @nodo2 = Node.new("pepe", nil, nil) 
        @nodo3 = Node.new("pepe1", nil, nil) 
        @nodo4 = Node.new("pepe2", nil, nil)    
    end   
    
    describe "Lista doblemente enlazada" do
      it "El nodo tiene cabeza" do
        expect(@nodo1.thevalue) != nil
      end
      it "El nodo tiene siguiente" do
        expect(@nodo1.thenext == nil)
      end
      it "El nodo tiene anterior" do
        expect(@nodo1.theprev == nil)
      end

      it "Se insertan nodos en la lista" do
        @lista.lpush(@nodo1)
        expect(@lista.head).to eq(@nodo1)
      end
      it "Se inserta un elemento por el principio" do
        @lista.lpush(@nodo1)
        @lista.lpush(@nodo2) 
        @lista.lpush(@nodo3)
        @lista.lpush(@nodo4)
        expect(@lista.head).to eq(@nodo4)
      end

      it "Se extrae el primer elemento de la lista" do
        @lista.lpush(@nodo1)
        @lista.lpush(@nodo2)
        @lista.lpop
        expect(@lista.head).to eq(@nodo1) 
      end

      #http://ruby-doc.org/core-2.1.4/Enumerable.html
      it "Probando bucle vacio" do
        @lista.each{|i| i}
      end
      it "Probando bucle con elementos" do
        @lista.lpush(@nodo1)
        @lista.lpush(@nodo2)
        @lista.each{|i| i}
      end
      it "Probando bucle con elementos" do
        @lista.lpush(@nodo1)
        @lista.lpush(@nodo2)
        @lista.all? {|i| i.length <=3 }
      end
    end #End describe
  end  #End describe list


