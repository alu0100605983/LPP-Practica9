require 'spec/spec_helper'
require 'question/simple_choice'
require 'question/linked_list'

module Question

    describe Question::SimpleChoice do
       
      before :each do
        @p1 = Question::SimpleChoice.new(:text => '¿Cuanto es 2+5 ?', :right => 7, :distractor => [2,5,10])
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

      end
    end #describe SimpleChoice

 describe TrueFalse do   
    before :each do
        @p2=TrueFalse.new(
          "Es apropiado que una clase Tablero herede de una clase Juego \n", "a) Verdadero \n",
          "b) Falso \n")      
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
    
    end #End describe List
  end  

end #module

