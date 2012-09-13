=begin
  á, é, í, ó, ú, ñ, Á, É, Í, Ó, Ú, Ñ
=end

#Clase para leer archivos y limpiarlos
class Limpiador
  
  def abs_path
    @abs_path
  end
  
  def criptograma
    @cadenota
  end
  
  #inicializador de la clase
  def initialize(ruta)
    @abs_path = ruta
  end
  
  #abre el archivo
  def abrir
    @cadenota = ""
    File.open("tmp", 'r') do |file|
      while linea = file.gets
        @cadenota.concat(linea)
      end
    end
  end
  
  #metodo para limpiar
  def limpiar_texto
    #puts @cadenota
    #Utilizando bash para limpiar textos
    system("sed 'y/\á\é\í\ó\ú\ñ\ü\Á\É\Í\Ó\Ú\Ñ/aeiounuAEIOUN/' #{@abs_path} > tmp")
    system("cat tmp | tr -d '.' > tmp2")
    system("cat tmp2 | tr -d ',' > tmp")
    system("cat tmp | tr -d '(' > tmp2")
    system("cat tmp2 | tr -d ')' > tmp")
    system("cat tmp | tr -d ':' > tmp2")
    system("cat tmp2 | tr -d ';' > tmp")
    system("sed 's/[ ]//g' tmp > tmp3")
    system("cat tmp3 | tr -d '\n' > tmp")
    system("rm tmp2")
    system("rm tmp3")
    abrir
  end
  
  def guardar_en_disco(texto_cifrado_)
    File.open('vigenere_completo.txt', 'w') do |archivo|
      archivo.puts texto_cifrado_
    end
    puts "Ya lo guarde"
  end
  
end #clase

#l = Limpiador.new('criptograma.txt')
#l.limpiar_texto
#puts l.methods.sort
#l.limpia_texto