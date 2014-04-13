pattern = /link_to '(.+)', '(.+)\/'/

Dir['**/*.slim'].each do |fname|
	text = File.read(fname).gsub(pattern, 'link_to \'\1\', \'\2/index.html\'')
	File.open(fname, 'w') do |f|
		f.write(text)
	end
end