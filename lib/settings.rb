module Settings
  extend self

  CONFIG_PATH = Pathname.new(File.expand_path('../../config/', __FILE__))

  def load
    @settings ||= begin
      env = ENV['ENV'] || 'development'

      settings = if env == 'test'
        load_file('settings.example.yml')
      else
        load_file('settings.yml')
      end
      settings = settings[env] || {}
      settings.deep_merge(load_file('secrets.json', JSON))
    end
  end

  def load_file(path, format = YAML)
    file = CONFIG_PATH.join(path)
    return {} unless file.exist?
    format.load(file.read) || {}
  end

  def get(*keys)
    keys.inject(load) { |config, key| config.try!(:[], key) }
  end

  def adapter
    get('robot', 'adapter')
  end

  def assign(config, settings = load)
    settings.each do |key, value|
      if value.is_a?(Hash)
        assign(config.public_send(key), value)
      else
        if config.respond_to?("#{key}=")
          config.public_send("#{key}=", value)
        end
      end
    end
  end
end
