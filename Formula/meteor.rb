class Meteor < Formula
  desc "Highly configurable CLI tool for writing conventional commits"
  homepage "https://github.com/stefanlogue/meteor"
  url "https://github.com/stefanlogue/meteor/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "8c6b5e56ebb31a1ffa94adfa226c970415bae61352699d8849e34773f7e42f91"
  license "MIT"
  head "https://github.com/stefanlogue/meteor.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -X main.version=#{version}")
  end

  test do
    system "#{bin}/#{name}", "-v"
  end
end
