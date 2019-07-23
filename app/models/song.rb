class Song < ActiveRecord::Base
	has_many :notes
	belongs_to :artist
	belongs_to :genre


	def notes=(ids)
     ids.each do |id|
       note = Note.create(content: id)
       self.notes << note
     end
   end

	def note_contents
		c = []
      if self.notes 
      	self.notes.map do |n|
      		c << n.content
      	end
      	return c
      else
      	return nil
      end
   end

   def note_contents=(notes)
	notes.each do |id|
		if id != ""
			note = Note.create(content: id)
       		self.notes << note
		end
       
     end
   end

	def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end
 
   def artist_name
      self.artist ? self.artist.name : nil
   end

   def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end
 
   def genre_name
      self.genre ? self.genre.name : nil
   end

end
