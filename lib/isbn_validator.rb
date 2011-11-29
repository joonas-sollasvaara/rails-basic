class IsbnValidator
  
  def validate(isbn)
    isbn = isbn.gsub(/-| /, "")
    return false if isbn =~ /[^0-9x]/i
    return validate_isbn10(isbn) if isbn.size == 10
    return validate_isbn13(isbn) if isbn.size == 13
    return false
  end
  
  private
  
  def validate_isbn10(isbn)
    sum = 0
    9.times { |i| sum += (10-i) * isbn[i].to_i }
    checksum = isbn[9] == 'X' ? 10 : isbn[9].to_i
    checksum == 11 - sum % 11
  end
  
  def validate_isbn13(isbn)
    sum = 0
    12.times do |i|
      mult = i % 2 != 0 ? 3 : 1
      sum += isbn[i].to_i * mult
    end
    isbn[12].to_i == (10 - sum % 10)
  end
  
end
