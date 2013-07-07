require 'rubygems'
require 'nokogiri'
require 'open-uri'

# blogs = [
# 		"http://kickkicksnare.com/2013/07/02/natalia-kills-saturday-night/",
# 		"http://toomanysebastians.net/2013/07/06/sirisumo-enthusiast-album-words/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+TooManySebastians+%28Too+Many+Sebastians%29&utm_content=Netvibes",
# 		"http://toomanysebastians.net/2013/07/03/lindstrom-hemingway-omg/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+TooManySebastians+%28Too+Many+Sebastians%29&utm_content=Netvibes",
# 		"http://toomanysebastians.net/2013/07/02/bryan-ferry-dont-stop-the-dance-todd-terje-remix/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+TooManySebastians+%28Too+Many+Sebastians%29&utm_content=Netvibes"
# 		]


blogs = 
		[
			{"Kick Kick Snare" => "http://kickkicksnare.com/2013/07/02/natalia-kills-saturday-night/"},
			{"Too Many Sebastians" => "http://toomanysebastians.net/2013/07/06/sirisumo-enthusiast-album-words/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+TooManySebastians+%28Too+Many+Sebastians%29&utm_content=Netvibes/"},
			{"Too Many Sebastians" => "http://toomanysebastians.net/2013/07/03/lindstrom-hemingway-omg/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+TooManySebastians+%28Too+Many+Sebastians%29&utm_content=Netvibes"},
			{"Too Many Sebastians" => "http://toomanysebastians.net/2013/07/02/bryan-ferry-dont-stop-the-dance-todd-terje-remix/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+TooManySebastians+%28Too+Many+Sebastians%29&utm_content=Netvibes"}
		]

fileHtml = File.new("output.html", "w+")
fileHtml.puts "<html style='background-color: #76E4F5'>"
fileHtml.puts "<h1>CloudHound</h1>"
fileHtml.puts "<br />"

blogs.each do |blog_hash|
	fileHtml.puts "<h3>#{blog_hash.keys.first}</h3>"
	blog_object = Nokogiri::HTML(open(blog_hash.values.first)) # Convert url into Nokogiri object
	iframes_array = blog_object.css("iframe").to_a  # Create array of all iframes
	iframes_array.each do |element|  
		if element.to_s.include?("soundcloud")
			fileHtml.puts element.to_s
		else
			puts "this one is no good"
			puts element.to_s
		end
	end
	fileHtml.puts "<br />"
	fileHtml.puts "<br />"
end

fileHtml.puts "</html>"
fileHtml.close
