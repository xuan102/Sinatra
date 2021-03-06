require_relative 'gossip'


class Comment
  attr_accessor :content, :id, :author

  # Cette fonction initialize un commentaire
  def initialize(id, content, author)
    @id = id.to_i
    @content = content
    @author = author
  end

  # Cette fonction permet de sauvergarder le commentaire
  def save
    CSV.open("db/comment.csv", "ab") do |row|
      row << [@id, @content, @author]
    end
  end

  # Cette function list tout les commentaire
  def self.all
    all_comment = []
    CSV.read("./db/comment.csv").each do |csv_line|
      all_comment << Comment.new(csv_line[0], csv_line[1], csv_line[2])
    end
    return all_comment
  end

  # Cette fonction permet de sortir une array de commentaire trier pars leur id 
  def self.by_id(id)
    arr = []
    self.all.each do |i|
      if i.id.to_i == id
        arr << [i.content, i.author]
      end
    end 
    return arr
  end
end
