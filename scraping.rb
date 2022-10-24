require "open-uri"
require "nokogiri"

url = "https://www.bbc.co.uk/food/search?q=cake"
local_url =  "recipes.html"

html = URI.open(local_url).read

parsed_html = Nokogiri::HTML(html)

parsed_html.search(".promo").first(1).each do |element|
    p element.search(".promo__title").text.strip
    p element.attr("href")
    p "==============================="

    show_url = "https://www.bbc.co.uk#{element.attr("href")}"

    show_html = URI.open(show_url).read

    show_parsed_html = Nokogiri::HTML(show_html)

    p show_parsed_html.search(".recipe-metadata__prep-time")[0].text
end