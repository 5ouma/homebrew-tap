class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  url "https://github.com/seachicken/gh-poi/archive/refs/tags/v0.18.4.tar.gz"
  sha256 "ff6f6e263b950780b027c1f4743d359b693504ee85ead5d58379f442d0eb09a4"
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
