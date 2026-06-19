class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  url "https://github.com/seachicken/gh-poi/archive/refs/tags/v0.18.1.tar.gz"
  sha256 "31b4c4ccace20c7faf9847b33611b8a7c952d5418e7897fa88c7c1025d4932c7"
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
