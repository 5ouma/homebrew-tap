class Mli < Formula
  desc "Manage macOS Login Items"
  homepage "https://github.com/5ouma/mli"
  url "https://github.com/5ouma/mli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "708ac0d044b066cadda7e1987ad4d571116c633984d68c1c7a136bdaec8082f7"
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
