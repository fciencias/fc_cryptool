=begin
	Archivo para cifrar en vigenere polialfabetico
=end

require 'limpiador.rb'

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
end#def


#puts "Abro el archivo y lo limpio"
lim = Limpiador.new('criptograma.txt')
lim.limpiar_texto
mi_texto = lim.criptograma

t = crea_tabla("MANIACO")
puts(t)

# Necesito el primer texto, el que hice con la llave
# para sacar el numero de alfabeto
alf = t[0]
#puts "================================="
#puts(alf)

# Para hacer la asignacion de valores
minusculas = "abcdefghijklmnopwrstuvwxyz"

mapeos = Hash.new

arreglo_mapeos = Array.new

# Con este ciclo nos aseguramos de que cada
# relacion se cumpla
6.times do |i|
  aux = t[i]
  #puts aux + " aux"
  26.times do |j|
    letra = "" << minusculas[j]
    clave = "" << aux[j]
    tmp = [letra, clave].join("->")
    arreglo_mapeos.push(tmp)
    #arreglo_mapeos.push(",")
    #puts tmp.to_s
  end
end

#puts arreglo_mapeos.to_s

map1 = arreglo_mapeos.take(26)
map2 = arreglo_mapeos.take(52)
map3 = arreglo_mapeos.take(78)
map4 = arreglo_mapeos.take(104)
map5 = arreglo_mapeos.take(130)
map6 = arreglo_mapeos.take(156)

mapeos = {map1, map2, map3, map4, map5, map6}

tam_tex = mi_texto.length
puts tam_tex
