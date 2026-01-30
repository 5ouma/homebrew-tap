class GhPoi < Formula
  desc "Safely clean up your local branches"
  homepage "https://github.com/seachicken/gh-poi"
  version "0.15.2-pre0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/seachicken/gh-poi/releases/download/v0.15.1/darwin-arm64"
      sha256 "ad71a1e8f08520a2284b5c5c00d465ce831d4af521f81ca57df0f63ef0c7d64c"

      def install
        bin.install "darwin-arm64" => "gh-poi"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/seachicken/gh-poi/releases/download/v0.15.1/darwin-amd64"
      sha256 "80c865eaa5ad27c468b01b4d0a7b98686aaa926f24b13c05344ba5b21f474827"

      def install
        bin.install "darwin-amd64" => "gh-poi"
      end
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/seachicken/gh-poi/releases/download/v0.15.1/linux-arm64"
      sha256 "c6e88781edfed5c50913263673fc5f1a20eb5357ddb009b60a79f290facf7517"

      def install
        bin.install "linux-arm64" => "gh-poi"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/seachicken/gh-poi/releases/download/v0.15.2-pre0/linux-amd64"
      sha256 "582a4561e82674ae85d7e202c7780c7a4325a756eeb314075415d2be625a109d"

      def install
        bin.install "linux-amd64" => "gh-poi"
      end
    end
  end

  test do
    system "#{bin}/#{name}", "-v"
  end
end
