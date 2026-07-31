class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  url "https://github.com/seachicken/gh-poi/archive/refs/tags/v0.18.3.tar.gz"
  sha256 "97bad9b3e1ffedd9d79eea3c5fc95c6c43e175eae3baf51a20195c65b94dd7c4"
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
