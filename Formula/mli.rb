class Mli < Formula
  desc "Manage macOS Login Items"
  homepage "https://github.com/5ouma/mli"
  url "https://github.com/5ouma/mli/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "efae770f996843f20f3d5ba3fb231bf5d9c5ea88c4a1f9268ddaf7186eb2f2d1"
  license "MIT"
  head "https://github.com/5ouma/mli.git", branch: "main"

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
