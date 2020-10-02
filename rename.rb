require 'nokogiri'

doc = File.open("Albert.html") { |f| Nokogiri::HTML(f) }

puts "### Search for nodes by css"
doc.css('tr.ps_grid-row').each do |link|

  

  if link['id'].include? "NYU_AE_CLASS_VW" 

    if not link.css('img')[0].nil?

      old_filename = link.css('img')[0]['src'].split("/").last.gsub("=", "")
      new_filename = link.css('a.ps-link').text().split("@").first + ".jpg"

      if(File.exist?(old_filename))
        
        File.rename(old_filename, new_filename)
      
        puts '*********UPDATED**********'

      else

        puts 'File does not exist'

      end
    end
  end
end





