require 'FileUtils'

class Normalization
  public
  def initialize
    #leo el contenido y esto se me queda en un string
    contenido = FileUtils.read_file('normalization.txt') 
  
    #creo mi hash que será el atributo del objeto
    @normalizacion = Hash.new
    #creo un array auxiliar donde voy a separar el string leido
    arrayNormalizacion = [] #también se puede crear con Array.new
    
    #con un each me lo recorro
    contenido.each_line { |line|
      line.tr!("\n|\r\n|\r","")             
      trocear = line.split(/[[:blank:]]---[[:blank:]]/)
      #al trocear quito el espacio en blaco y las --- y añado al array "un array de dos string"
      arrayNormalizacion << trocear #esto quedaria asi [["d", "de"], ["q", "que"], ["dj", "deja"].... si lo imprimirmos
    }
    
    long = arrayNormalizacion.length
    
    #recorro cada pos del array, y añado al hash de cada pos el primero y ultimo de "array de dos"
    for i in (0..long-1) 
      @normalizacion[arrayNormalizacion[i].first] = arrayNormalizacion[i].last
    end
    return @normalizacion
  end
  
  #esta función me devuelve las claves de mi hash de normalización es decir  "d" "q" "dj".... en un array
  def devolver_keys
    keys_values = []
    for palabra in @normalizacion
      keys_values.push(palabra)
    end
    return keys_values
  end
 
end#fin de la clase

