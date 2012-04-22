def Parse(file)

	@ableton = {}

	doc = Hpricot.XML file

	@ableton[:Tracks] = doc.search("//Tracks//Name/EffectiveName[@Value]").map do |track|
		track.attributes['Value']
	end

	@ableton[:MasterTrack] = doc.search("//MasterTrack/Name/EffectiveName[@Value]").map do |track|
		track.attributes['Value']
	end

end

# @ableton[:Tracks]				= doc.search("//Tracks//Name/EffectiveName[@Value]")
# @ableton[:MasterTrack]	= doc.search("//MasterTrack/Name/EffectiveName")

=begin
puts '-- Audio Tracks --'

(doc/:AudioTrack/:Name/:EffectiveName).each do |track|
	puts track.attributes['Value']
end

puts '-- Midi Tracks --'

(doc/:MidiTrack/:Name/:EffectiveName).each do |track|
	puts track.attributes['Value']
end

puts '-- Return Tracks --'

(doc/:ReturnTrack/:Name/:EffectiveName).each do |track|
	puts track.attributes['Value']
end

puts '-- Master Track --'

(doc/:MasterTrack/:Name/:EffectiveName).each do |track|
	puts track.attributes['Value']
end
=end
