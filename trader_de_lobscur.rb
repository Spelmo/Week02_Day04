# fait un programme qui va récupérer le cours de toutes les cryptomonnaies,
# et les enregistrer bien proprement dans une array de hashs.
# fais en sorte que ton programme tourne en boucle, et prenne lex taux toutes les heures

require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_crypto(url)
  doc = Nokogiri::HTML(open(url))
  hash ={}
  name = []
  value = []

  name_links = doc.css("a.currency-name-container")
  name_links.each{|link| name << link.text}

  value_links = doc.css("a.price")
  value_links.each{|link| value << link.text}

  0.upto(name.length) do |i|
    hash[name[i]]=value[i]
  end
  puts hash
end

# boucle infinie qui repete le calcul toutes les 3600 secondes, soit toutes les heures
loop do
get_the_crypto('https://coinmarketcap.com')
sleep(3600)
end
