card_cvs = File.new("./card_data.csv", 'w')

1.upto(8000).each do |i|
  card = File.new("./cards/#{i}", 'r').read
  data =  card.split("\n")[1,46].map{|x| x.split(",")[2]}.join(",")
  card_cvs << [i.to_s.rjust(4, "0"), data].join(",") + "\n"
end

card_cvs.close


card_freq_file = File.new("./card_frequency.csv", 'w')

card_freq = {}
1.upto(8000).each do |i|
  card = File.new("./cards/#{i}", 'r').read
  card.split("\n")[1,46].map{|x| x.split(",")[2]}.each do |card_title|
    card_freq[card_title] ||= 0
    card_freq[card_title] += 1
  end
end

card_freq.sort_by{|k,v| v}.reverse.each do |k,v|
  card_freq_file << "#{k},#{v}" + "\n"
end

card_freq_file.close
