 #In terminal:
 #gem install httparty
 #gem install nokogiri

require 'HTTParty'
require 'nokogiry'

url ='https://www.anekdot.ru/'
html = HTTParty.get(url)
doc = Nokogiri::HTML(html)

puts doc.css('.text')[0].text
