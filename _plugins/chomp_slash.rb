module Jekyll
  module ChompSlashFilter
    def chomp_slash(input)
      input.chomp('/')
    end
  end
end

Liquid::Template.register_filter(Jekyll::ChompSlashFilter)