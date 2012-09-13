=begin
	Archivo para cifrar en vigenere polialfabetico
=end

#Alfabeto estandar para cifrar
ALFABETO = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"


=begin
  Dado un alfabeto, hace un corrimiento de n lugares
  regresando el alfabeto recorrido y ciclico
=end
def recorre(alfabeto, corrimiento)
  i = 0
  while i < corrimiento
    c = alfabeto[i]
    alfabeto << c
    i= i+1
  end
  alfabeto.slice!(0...i)
  return alfabeto
end


=begin
  dada una palabra clave(llave) construlle una
  tabla tipo vigenere polialfabetica.
=end
def crea_tabla(llave)
  renglon = Array.new
  tam = llave.length
  tam.times do |i|
    tmp = "" << llave[i]
    if ALFABETO.include? tmp
      renglon.push(tmp)
      ALFABETO.delete! tmp
    end
  end
  ALFABETO.chars{|c| renglon.push(c)}
  tabla = Array.new
  tabla.push(renglon.to_s)
  for i in (1...26)
    aux = recorre(renglon.to_s, i)
    tabla.push(aux)
  end#for
  return tabla  
end #end def

t = crea_tabla("SARAMAGO")
puts(t)