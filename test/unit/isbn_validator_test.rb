require 'test_helper'

class IsbnValidatorTest < ActiveSupport::TestCase  
  VALID_ISBNS = {
    '951-98548-9-4'     => 'ISBN 10 with dashes',
    '951 98548 9 4'     => 'ISBN 10 with spaces',
    '9519854894'        => 'ISBN 10 without dashes',
    '978-1-934356-54-8' => 'ISBN 13 with dashes',
    '978 1 934356 54 8' => 'ISBN 13 with spaces',
    '9781934356548'     => 'ISBN 13 without dashes'
  }
  INVALID_ISBNS = {
    '123456789a'        => 'ISBN 10',
    '123456789a123'     => 'ISBN 13'
  }
  VALID_ISBNS.each do |value, title|
    test "valid #{title}" do
      assert IsbnValidator.new.validate(value)
    end
  end
  INVALID_ISBNS.each do |value, title|
    test "invalid #{title}" do
      assert !IsbnValidator.new.validate(value)
    end
  end
end