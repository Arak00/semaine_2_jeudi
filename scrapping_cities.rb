require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
#On appelle la page à scraper
page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
#A partir du css de cette page on vient chercher l'adresse email
#liée à cette classe
page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |el|
   puts el.text
	end
end

get_the_email_of_a_townhal_from_its_webpage


def get_all_city_names
#on appelle la page à scraper
page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
# On
news_links = page.css(".Style20")
news_links.each{|link| puts "#{link.text}"}
end
get_all_city_names

def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	# On
	news_links = page.css('/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]')
	news_links.each{|link| puts "#{link.text}"}
end
