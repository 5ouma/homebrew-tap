class Dorg < Formula
  desc "Organize macOS Dock Items"
  homepage "https://github.com/5ouma/dorg"
  url "https://github.com/5ouma/dorg/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "e42e04621f6026d11174c07a7156f4582aaf4f3bad78b33723353f79ef76e8ce"
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
