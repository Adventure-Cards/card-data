card_cvs = File.new("./card.csv", 'w')

1.upto(8000).each do |i|
  card = File.new("./cards/#{i}", 'r').read
  data =  card.split("\n")[1,46].map{|x| x.split(",")[2]}.join(",")
  card_cvs << [i.to_s.rjust(4, "0"), data].join(",") + "\n"
end

