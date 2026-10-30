class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli"
  version "0.4.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.1/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "f687ab77c19bd5bb8edaff1e6a55fbf4735802d39a45521eb5aaedc17a61cb29"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.1/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "39abe69630f1152f4cb75488d6a52a6f75834e288f1df54d8d947d3b0245f987"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.1/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f167af40547bd4fa3b8546ed15c4d800774d14191cb5f14ac21f1b103912fff9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.1/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c3d3eed331e5eac07e612a3bc1b05b8a01a7df8396e43ccf33aecce98450513a"
  end

  def install
    # Bundled Rust-native servers (lsp-json-lsp, lsp-css-lsp,
    # ...) must sit next to  itself — registry.rs resolves
    # each one relative to the running executable's own
    # directory. Globbed so adding another bundled server
    # doesn't need another edit here; installing them all into
    # the same bin/ keeps that true under Homebrew too.
    bin.install "lsp"
    bin.install Dir["lsp-*-lsp"]
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
