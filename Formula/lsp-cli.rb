class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli"
  version "0.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "cf9d33f1a53b27c2f528ec466892569460e165c8248e0421462ab5a314a8ac70"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "cc7680831539500c2cdcc88e32eec3fa9c04548d6f88d6aa3e84c85a9d320ec2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ab7acf5290bea35cadba577bac8fb40e2eb711cf1ab5ecb2ad8740f70054a433"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c62dabd617e99a16ebbc8b7197e4a97ebbf509bf548507c2816c0c4109c50c3c"
  end

  def install
    bin.install "lsp"
  end

  def caveats
    <<~EOS
      lsp-cli is installed! Get started:

        lsp --help
        lsp install --all      # install language servers you'll actually use
        lsp outline path/to/file.ts

      Full documentation: https://github.com/huyz0/lsp-cli
    EOS
  end

  test do
    system "#{bin}/lsp", "--help"
  end
end
