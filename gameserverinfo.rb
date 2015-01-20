require "mechanize"

servers = []

public
def get_info(server)
  agent = Mechanize.new
  server_page = agent.get("http://www.gametracker.com/server_info/" + server)
  server_name = server_page.at("body > div.page_content > div.item_float_left > div:nth-child(1) > div.block630_content_left > a:nth-child(3) > b").text.strip
  current_map = server_page.at("#HTML_curr_map").text.strip
  current_players = server_page.at("#HTML_num_players").text.strip
  max_players = server_page.at("#HTML_max_players").text.strip

  puts "\n"
  puts "#{server_name}"
  puts "#{current_map}"
  puts "Players: #{current_players}/#{max_players}"
  puts "\n"
end

servers.each { |server| server.get_info(server) }
