class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  url "https://github.com/seachicken/gh-poi/archive/refs/tags/v0.18.5.tar.gz"
  sha256 "a252a0e7922c46dff689becbf68fdc0bc0b9b1308f9f705b9f4d4594f5547144"
  license "MIT"
  head "https://github.com/seachicken/gh-poi.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args
  end

  test do
    system "git", "init", testpath
    cd testpath do
      system "git", "config", "user.email", "test@example.com"
      system "git", "config", "user.name", "Homebrew Test"
      system "git", "commit", "--allow-empty", "-m", "initial commit"
      system "git", "switch", "-c", "test-branch"
      system "#{bin}/#{name}", "lock", "test-branch"
      assert_equal "true", shell_output("git config branch.test-branch.gh-poi-locked").strip
      system "#{bin}/#{name}", "unlock", "test-branch"
      assert_empty shell_output("git config branch.test-branch.gh-poi-locked 2>/dev/null", 1)
    end
  end
end
