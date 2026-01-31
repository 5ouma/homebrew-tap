class Dorg < Formula
  desc "Organize macOS Dock Items"
  homepage "https://github.com/5ouma/dorg"
  url "https://github.com/5ouma/dorg/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "fb252b7c4f05a17ab269d1b4d47078579bdfc4455c335d44dae5423856ea4084"
  license "MIT"
  head "https://github.com/5ouma/dorg.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    generate_completions_from_executable("#{bin}/#{name}", "completion")
  end

  test do
    system "#{bin}/#{name}", "-v"
  end
end
