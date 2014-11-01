require 'spec/spec_helper'
require 'question/simple_choice'
require 'question/linked_list'

module Question
  class SimpleChoice
  
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

      end

    end #describe

  end #class

  class Exam

    describe Question::Exam do
      before :each do
        @vq = SimpleChoice.new(:text => '¿Cuanto es 2+5 ?', :right => 7, :distractor => [2,5,10])
        @vnode = Node.new(@vq, nil)
        @exam = List.new()
      end

    context "Node" do     
      it "Debe existir un Nodo de la lista con sus datos y su siguiente" do         
         expect(@vnode.thevalue)==@vq
         expect(@vnode.thenext)==nil
      end
    end  

    context "List" do     
      it "Debe existir un Nodo de la lista con sus datos y su siguiente" do         
         expect(@vnode.thevalue)==@vq
         expect(@vnode.thenext)==nil
      end

      it "Se puede insertar un elemento" do
        expect(@exam).to respond_to :lpush
        expect(@exam.lpush(@vnode))== @vnode
      end

      it "Se puede extraer el primer elemento de la lista" do #insertamos y sacamos
        expect(@exam).to respond_to :lpop
        expect(@exam.lpush(@vnode))== @vnode
        expect(@exam.lpop)== @vq
      end

      it "Se pueden insertar varios elementos" do #inserta el mismo elemento varias veces
        expect(@exam).to respond_to :lpush
        expect(@exam.lpush(@vnode))== @vnode
        expect(@exam.lpush(@vnode))== @vnode
      end

      it "Debe existir una Lista con su cabeza" do
        expect(@exam).to respond_to :head
      end
    end  #context list

      it "Debe mostrarse correctamente formateado" do
       
        pregunta = "¿Cuál es la salida del siguiente código Ruby?\nclass Xyz\n\sdef pots\n\s\s@nice\n\send\nend\n\nxyz = Xyz.new\np xyz.pots"
        vart="nil"
        var1="#<Xyz:0xa000208>"
        var2="0"
        var3="Ninguna de las anteriores"
        texto = SimpleChoice.new(:text => pregunta, :right =>vart, :distractor => [var1,var2,var3])
        nodo = Node.new(texto, nil)
        @exam.lpush(nodo)

        pregunta ="La siguiente definición de un hash en Ruby es válida:\nhash_raro = {\n\s[1, 2, 3] => Object.new(),\nHash.new => :toto\n}"
        vart="Falso"
        var1="Cierto"
        texto = SimpleChoice.new(:text => pregunta, :right =>vart, :distractor => [var1])
        nodo = Node.new(texto, nil)
        @exam.lpush(nodo)

        pregunta =%Q{¿Cuál es la salida del siguiente código Ruby?\nclass Array\n\sdef say_hi\n\s\s"HEY!"\n\send\nend\n p [1, "bob"].say_hi}
        vart="HEY!"
        var1="1"
        var2="bob"
        var3="Ninguna de las anteriores"
        texto = SimpleChoice.new(:text => pregunta, :right =>vart, :distractor => [var1, var2, var3])
        nodo = Node.new(texto, nil)
        @exam.lpush(nodo)

        pregunta ="¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend"
        vart="Una instancia de la clase Class"
        var1="Una Constante"
        var2="Un Objeto"
        var3="Ninguna de las anteriores"
        texto = SimpleChoice.new(:text => pregunta, :right =>vart, :distractor => [var1, var2, var3])
        nodo = Node.new(texto, nil)
        @exam.lpush(nodo)

        pregunta ="Es apropiado que una clase Tablero herede de una clase Juego"
        vart="Falso"
        var1="Cierto"
        texto = SimpleChoice.new(:text => pregunta, :right =>vart, :distractor => [var1])
        nodo = Node.new(texto, nil)
        @exam.lpush(nodo)
      end

    end #describe
  end #class Exam

end #module

