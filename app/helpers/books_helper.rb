module BooksHelper
  def book_class_from_age(date_published) 
    return "" if date_published.blank?
    return case 
    when date_published < Date.parse('1960-01-01')
      "age-50"
    when date_published < Date.parse('1970-01-01')
      "age-60"
    when date_published < Date.parse('1980-01-01')
      "age-70"
    when date_published < Date.parse('1990-01-01')
      "age-80"
    when date_published < Date.parse('2000-01-01')
      "age-90"
    when date_published < Date.parse('2010-01-01')
      "age-00"
    when date_published >= Date.parse('2010-01-01')
      "age-10"
    end
  end

  class PublishDateConverter
    def self.convert(value)
      return Date.new(value,1,1) if !value.to_s.include?('-')
      return value
    end
  end
end
