class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  url "https://github.com/seachicken/gh-poi/archive/refs/tags/v0.17.2.tar.gz"
  sha256 "1a9278bd6d71a6ce9680e009aee1defcfd6b90da9284fa6457086c7054efc5f8"
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
