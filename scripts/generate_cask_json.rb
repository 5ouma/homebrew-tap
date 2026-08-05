# typed: strict
# frozen_string_literal: true

require "json"
require "cask"

changed = false

Pathname("Casks").glob("**/*.rb").each do |path|
  loader = Object.new
  loader.define_singleton_method(:cask) { |token, &block| @cask = Cask::Cask.new(token, &block) }
  loader.instance_eval(path.read, path)

  cask = loader.instance_variable_get(:@cask) || raise("No cask found in #{path}")
  data = cask.to_h

  data["artifacts"]&.each do |artifact|
    next unless artifact.is_a?(Hash)

    artifact.each do |key, value|
      artifact[key] = value.sub(Dir.home, "~") if key.to_s == "target" && value.is_a?(String)
    end
  end

  json = "#{JSON.pretty_generate(data)}\n"
  file = Pathname("api/cask").tap(&:mkpath).join("#{cask.token}.json")

  changed ||= file.exist? && file.read != json
  file.write(json)

  puts "Generated #{file}"
end

exit 1 if changed
