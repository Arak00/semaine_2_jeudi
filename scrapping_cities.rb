require 'open-uri'
require 'nokogiri'

def get_all_the_urls_of_val_doise_townhalls
  #ouvre l'URL prête à être scrapée
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  #créé une liste vide
  final = Array.new
  page.css('.a[href]').each do |url|
    urls = url['href']
    #ajoute la liste d'URL
    final.push ("http://annuaire-des-mairies.com#{urls}")
  end
  final
end


def get_the_email_of_a_townhal_from_its_webpage(page_url)
  page = Nokogiri::HTML(open(page_url))
  puts page.css('tr')[4].css('td')[1]
end
#créé une liste composée des urls scrapées
array_url = get_all_the_urls_of_val_doise_townhalls()
#retourne la liste d'urls scrapée
array_url.each do |url|
  puts get_the_email_of_a_townhal_from_its_webpage(url)
end
# On définit une méthode pour scraper les noms
# de toutes les villes depuis une URL ciblée

def get_all_city_name
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    news_names = page.css("a.lientxt").text
end

puts get_all_city_name

def get_all_the_urls_of_val_doise_townhalls_2
  #ouvre l'URL prêtre à être scrapée
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  #sélectionne les urls dans la boucle
  page.css(".lientxt[href]").select do |urls|
  #modifie et remplace le préfixe de l'URL
  puts urls['href'].gsub('./95/', 'https://annuaire-des-mairies.com/')
  end
end

puts get_all_the_urls_of_val_doise_townhalls_2
