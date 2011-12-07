atom_feed do |feed|
  feed.title "Books"
  feed.updated @books.first.created_at
  
  @books.each do |book|
    feed.entry(book) do |entry|
      entry.title book.title
      entry.content book.description
    end
  end
  
end
