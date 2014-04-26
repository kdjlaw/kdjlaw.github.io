# Dir.glob('./*/*.slim').each do |f|

# 	new_name = File.join(File.dirname(f), 'index.html')

# 	puts new_name

# 	File.rename(f,new_name)
# end

Dir.glob('./*/index.html.slim').each do |f|

	pages = [

		['contact_us', '/contact-us/'],
		['firm_overview','/firm-overview'],
		['practice_areas','/practice-areas/'],
		['settlements_and_verdicts','/settlements-and-verdicts/']

	]

	areas = [
		['auto_accident_injury','/auto-accident-injury/'],
		['brain_trauma','/brain-trauma/'],
		['construction_site_accidents','construction-site-accidents'],
		['dog_bite_injuries','/dog-bite-injuries/'],
		['legal_malpractice','/legal-malpractice/'],
		['medical_malpractice','/medical-malpractice/'],
		['motorcycle_accidents','/motorcycle-accidents/'],
		['neck_and_back_injuries','/neck-and-back-injuries/'],
		['nursing_home_negligence','/nursing-home-negligence/'],
		['personal_injury','/personal-injury/'],
		['products_liability','/products-liability/'],
		['shoulder_injuries','/shoulder-injuries/'],
		['slip_and_fall','/slip-and-fall/'],
		['third_party_liability','/third-party-liability/'],
		['truck_accidents','/truck-accidents/'],
		['workers_compensation','workers-compensation'],
		['wrongful_death', '/wrongful-death/']
	]

	puts "#{f}: ", ''

	text = File.read(f).gsub(/#/,'').gsub('div[style="clear:both"]','')
	
	pages.each do |page|
		text.gsub!(page[0],page[1])
	end

	areas.each do |area|
		pattern = area[0]
		replacement = "/practice-areas#{area[1]}"
		text.gsub!(pattern,replacement)
	end

	text.gsub!(/link_to \'(.+?)\', 'attorneys'/, 'link_to \'\1\', \'/attorneys/\'')

	File.open(f,'w') do |file|
		file.write(text)
	end

# 	new_name = File.join(File.dirname(f), 'index.html.slim')

# 	File.rename(f, new_name)
end