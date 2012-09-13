#Clase para leer archivos y limpiarlos
class Limpiador
  
  #inicializador de la clase
  def initialize(ruta)
    @abs_path = ruta
  end
  
  #abre el archivo
  def abrir
    cadenota = ""
    File.open("#{@abs_path}", 'r') do |file|
      while linea = file.gets
        cadenota.concat(linea)
      end
    end
    return cadenota
  end
  
  #metodo para limpiar
  def limpia_texto
    #archivo = case
    #when File.file? 
    puts "Not ready yet."
  end
  
end #clase


l = Limpiador.new('mi_archivo.txt')
c = l.abrir
#puts l.methods.sort
puts c