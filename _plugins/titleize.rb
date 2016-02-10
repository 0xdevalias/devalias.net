module Jekyll
  module TitleizeFilter
    def titleize(input)
      input.gsub(/\w+/) do |word|
        word.capitalize
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::TitleizeFilter)