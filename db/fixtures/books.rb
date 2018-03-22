yaml = "#{Rails.root}/db/fixtures/books.yml"
books = YAML.load_file(yaml)

def create_book(id: nil, title: nil, author: nil)
  Book.seed do |s|
    s.id = id
    s.title = title
    s.author = author
    s.is_in_shelf = false
  end
end

books.map(&:symbolize_keys).each.with_index do |book, i|
  create_book(id: i + 1, title: book[:title], author: book[:author])
end
