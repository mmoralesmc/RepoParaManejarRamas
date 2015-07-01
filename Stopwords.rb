require 'FileUtils'
class Stopwords
  public
  def initialize
      @stop = Array.new
      arrayStopwords=[]
      arrayStopwords = FileUtils.read_file('stopwords.txt')

      otro = []
      arrayStopwords.each_line { |line|
         line.tr!("\n|\r\n|\r|'_'|'''","")                  
         trocear = line.split(/\n/)        
         otro.push(trocear)  
       }  

       long = otro.length

       for i in (0..long-1)
         @stop[i] = otro[i].first
       end  
    
       return @stop         
  end
  #dump → new_str para quitar los /n y no se reemplce por nada
 
  #metodo que que mira si una palabra está contenida en el array de stopwords
  def contiene_palabra_en_stopwords(palabra)  
    palabra_minus = palabra.downcase()  #primero paso la palabra a minuscula
    if @stop.include?(palabra_minus) #y luego veo si está incluida
     return true
   else
     return false
   end
  end

end