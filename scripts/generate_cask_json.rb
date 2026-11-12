# typed: strict
# frozen_string_literal: true

require "json"
require "cask"

output = Pathname("api/cask").mkpath

casks = Pathname("Casks").glob("**/*.rb")
expected = casks.map { |path| output.join("#{path.basename(".rb")}.json") }
(output.glob("*.json") - expected).each(&:delete)

casks.each do |path|
  loader = Object.new
  loader.define_singleton_method(:cask) { |token, &block| @cask = Cask::Cask.new(token, &block) }
  loader.instance_eval(path.read, path)

  cask = loader.instance_variable_get(:@cask) || raise("No cask found in #{path}")
  data = cask.to_h

  data["artifacts"]&.each do |artifact|
    next unless artifact.is_a?(Hash)

    artifact.each do |key, value|
      artifact[key] = value.sub(Dir.home, "~") if key == "target" && value.is_a?(String)
    end
  end

  json = "#{JSON.pretty_generate(data)}\n"
  file = output.join("#{cask.token}.json")

  if file.exist? && file.read == json
    puts "Skipped #{file}"
  else
    file.write(json)
    puts "Generated #{file}"
  end
end
