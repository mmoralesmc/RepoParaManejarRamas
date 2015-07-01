class FileUtils
 
#como es orientación a objetos, y esta clase no tiene atributos por lo que no modifica el estado de 
#los mismos, he hecho estático los métodos simplemente poniendo el nombre de la clase delante del metodo
   
   def FileUtils.list_files(folder_name)
      file_list = []
      Dir.new(folder_name).each do |archivo|
        file_list << archivo
      end
      
      return file_list
   end
   
   def FileUtils.read_file(file_name)
     content = ""
     File.open(file_name, "r") do |f|
         while linea = f.gets
            content += linea
         end
     end
     
     return content
   end
  #esta función no la utilizo al final  
  def FileUtils.read_fileArray(file_name)
     content = []
     File.open(file_name, "r") do |f|
         while linea = f.gets
              content = content.push(linea)
            end
     end
     return content
  end 
end