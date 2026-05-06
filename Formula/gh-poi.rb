class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  url "https://github.com/seachicken/gh-poi/archive/refs/tags/v0.17.1.tar.gz"
  sha256 "2781241b58a577d8d260120bbd063f7c1910a2a525c7c73459f12fb9c6de956d"
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
