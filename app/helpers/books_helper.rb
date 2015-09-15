module BooksHelper
  class PublishDateConverter
    def self.convert(value)
      return Date.new(value,1,1) if !value.to_s.include?('-')
      return value
    end
  end
end
