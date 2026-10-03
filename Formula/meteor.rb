class Meteor < Formula
  desc "Highly configurable CLI tool for writing conventional commits"
  homepage "https://github.com/stefanlogue/meteor"
  url "https://github.com/stefanlogue/meteor/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "8c6b5e56ebb31a1ffa94adfa226c970415bae61352699d8849e34773f7e42f91"
  license "MIT"
  head "https://github.com/stefanlogue/meteor.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    cd testpath do
      system "git", "init"
      system "git", "config", "user.email", "test@example.com"
      system "git", "config", "user.name", "Homebrew Test"

      ENV["HOME"] = (testpath/"home").to_s
      mkdir_p testpath/"home"
      (testpath/"home/.meteor.json").write <<~JSON
        {"showIntro":false,"allowCustomPrefixes":true,
         "allowCustomScopes":true,"prefixes":[{"type":"fix","description":"a fix"}]}
      JSON

      command = "script -q /dev/null -c " \
                "'#{bin}/#{name} --as-git-editor --skip-breaking-change .git/COMMIT_EDITMSG'"
      output = pipe_output(command, "fix\n\n\n\n\n\n")
      assert_match "fix", output
    end
  end
end
