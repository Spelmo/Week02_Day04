require 'rubygems'
require 'nokogiri'
require 'open-uri'

# fonction qui recupere l'adresse mail de chaque député
def get_the_deputy_email(url)
  doc = Nokogiri::HTML(open(url))
  email = ''
	  doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a').each do |node|
  	email = node["href"].slice!(7..-1)
    return email.to_s
  	end
end

# cherche tous les depute et cree un hash avec leur nom et email
def get_the_deputy_contact(url)
  doc = Nokogiri::HTML(open(url))
  hash = {}

  doc.xpath('//*[@id="deputes-list"]//li/a').each do |node|
    html = "http://www2.assemblee-nationale.fr" + node["href"]
    hash[node.text]=get_the_deputy_email(html)
  end
  puts hash
end


 get_the_deputy_contact("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")
# get_the_deputy_email('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036')
