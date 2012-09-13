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

puts "Ingresa la llave"
@la_llave = gets.chomp

t = crea_tabla("#{@la_llave}")
puts(t)

# Necesito el primer texto, el que hice con la llave
# para sacar el numero de alfabeto
alf = t[0]
#puts "================================="
#puts(alf)

# Para hacer la asignacion de valores
minusculas = "abcdefghijklmnopqrstuvwxyz"
mi_texto = mi_texto.downcase
mapeos = Array.new

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

puts arreglo_mapeos.to_s

map1 = arreglo_mapeos[0..25]
map2 = arreglo_mapeos[26..51]
map3 = arreglo_mapeos[52..77]
map4 = arreglo_mapeos[78..103]
map5 = arreglo_mapeos[104..129]
map6 = arreglo_mapeos[130..155]

mapeos = [map1, map2, map3, map4, map5, map6]

salida = ""

tam_tex = mi_texto.length

indice = 0
j = indice
otra_llave = "#{@la_llave}"
while indice < tam_tex-1
  j = j%7
  tmp = "" << otra_llave[j]
  num_alfabeto = case
    when tmp == 'M' then 0
    when tmp == 'A' then 1
    when tmp == 'N' then 2
    when tmp == 'I' then 3
    when tmp == 'C' then 4
    when tmp == 'O' then 5
  end
  alf_map = mapeos[num_alfabeto].to_s
  puts "indice " + indice.to_s() + " " + alf_map
  letra = mi_texto[indice]  
  #puts letra.chr
  posicion = alf_map.index(letra.chr)
  #puts posicion
  le_toca = "" << alf_map[posicion + 3]
  salida.concat(le_toca)
  j = j + 1
  indice = indice + 1
  #puts "indice = " + indice.to_s()
end #while pero me falta meterle todo lo de abajo
  

puts salida  
lim.guardar_en_disco(salida)
