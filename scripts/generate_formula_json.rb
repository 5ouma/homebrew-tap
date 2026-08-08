# typed: strict
# frozen_string_literal: true

require "json"
require "formulary"
require "tap"

root = Pathname(__dir__).parent.expand_path

root.join("Formula").glob("**/*.rb").each do |path|
  token = path.basename(".rb").to_s

  formula = Formulary.from_contents(
    token,
    path,
    path.read,
    tap: Tap.fetch(ARGV.fetch(0)),
  )

  data = formula.to_hash
  data["ruby_source_path"] = path.relative_path_from(root).to_s
  data["tap_git_head"] = "HEAD"

  json = "#{JSON.pretty_generate(data)}\n"
  file = root.join("api/formula").tap(&:mkpath).join("#{formula.name}.json")

  if file.exist? && file.read == json
    puts "Skipped #{file}"
  else
    file.write(json)
    puts "Generated #{file}"
  end
end
