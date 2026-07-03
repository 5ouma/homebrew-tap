class Dorg < Formula
  desc "Organize macOS Dock Items"
  homepage "https://github.com/5ouma/dorg"
  url "https://github.com/5ouma/dorg/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "aa27cef7b24a7884e04db9b97f0367c2393789fd332987f37e9277d4d4e721f6"
  license "MIT"
  head "https://github.com/5ouma/dorg.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s")
    generate_completions_from_executable("#{bin}/#{name}", "completion")
  end

  test do
    system "#{bin}/#{name}", "-v"
  end
end
