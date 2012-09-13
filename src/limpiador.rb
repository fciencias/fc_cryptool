=begin
  á, é, í, ó, ú, ñ, Á, É, Í, Ó, Ú, Ñ
=end

#Clase para leer archivos y limpiarlos
class Limpiador
  
  def abs_path
    @abs_path
  end
  
  def texto
    @cadenota
  end
  
  #inicializador de la clase
  def initialize(ruta)
    @abs_path = ruta
  end
  
  #abre el archivo
  def abrir
    @cadenota = ""
    File.open("#{@abs_path}", 'r') do |file|
      while linea = file.gets
        @cadenota.concat(linea)
      end
    end
  end
  
  #metodo para limpiar
  def limpia_texto
    puts "Voy a limpiar esta cadena: "
    puts @cadenota
    #Utilizando bash para limpiar textos
    system("sed 'y/\á\é\í\ó\ú\ñ\Á\É\Í\Ó\Ú\Ñ/aeiounAEIOUN/' #{@abs_path} > tmp")
    #system("sed 's/[\n$]/:/g' tmp > tmp3")
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
  end
  
end #clase


l = Limpiador.new('criptograma.txt')
l.abrir
#puts l.methods.sort
l.limpia_texto