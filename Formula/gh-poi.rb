class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  url "https://github.com/seachicken/gh-poi/archive/refs/tags/v0.18.0.tar.gz"
  sha256 "bf7aa04a7d01cbd93baa6fdcbc48a8c78b6fee9434e7008aadac732d4c511547"
  license "MIT"
  head "https://github.com/seachicken/gh-poi.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s")
  end

  test do
    system "#{bin}/#{name}", "-h"
  end
end
