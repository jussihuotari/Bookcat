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

  def book_color_overlay_from_age(date_published)
    return ";" if date_published.blank?
    return case
    when date_published < Date.parse('1960-01-01')
      "linear-gradient( rgba(145, 120, 43, .85), rgba(145, 120, 43, .85) )"
    when date_published < Date.parse('1970-01-01')
      "linear-gradient( rgba(155, 164, 61, .85), rgba(155, 164, 61, .85) )"
    when date_published < Date.parse('1980-01-01')
      "linear-gradient( rgba(206, 209, 52, .85), rgba(206, 209, 52, .85) )"
    when date_published < Date.parse('1990-01-01')
      "linear-gradient( rgba(198, 200, 113, .85), rgba(198, 200, 113, .85) )"
    when date_published < Date.parse('2000-01-01')
      "linear-gradient( rgba(197, 200, 122, .85), rgba(197, 200, 122, .85) )"
    when date_published < Date.parse('2010-01-01')
      "linear-gradient( rgba(247, 246, 182, .85), rgba(247, 246, 182, .85) )"
    when date_published >= Date.parse('2010-01-01')
      "linear-gradient( rgba(216, 255, 170, 0.85), rgba(216, 255, 170, 0.85) )"
    end
  end

  def book_cover_librarything(book)
    return "" if book.isbn.blank?
    return "https://www.librarything.com/devkey/#{Rails.application.secrets.api_key_librarything}/large/isbn/#{book.isbn}"
  end

  class PublishDateConverter
    def self.convert(value)
      return Date.new(value,1,1) if !value.to_s.include?('-')
      return value
    end
  end
end
