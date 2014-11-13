require 'question/simple_choice'
require "question/simple_choice/version"
require "question/linked_list.rb"
require "question/simple_choice.rb"

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
        valor = "\n#{@text}\n"
        @options.each do |opt|
          valor += "#{opt}\n" 
        end
        valor
     end
    
  end #simplechoice

#no se ejecutara desde un require solo de consola
if __FILE__ == $0 then
    qq = Question::SimpleChoice.new(text: '2+5 =', right: 7, distractor: [2,5,10])
    puts qq.to_html
    #puts qq.mostrar_pregunta
    #puts qq.mostrar_respuestas
    #puts qq.to_s
end