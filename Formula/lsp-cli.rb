class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli-rust"
  version "0.0.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli-rust/releases/download/v0.0.0/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli-rust/releases/download/v0.0.0/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli-rust/releases/download/v0.0.0/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli-rust/releases/download/v0.0.0/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000"
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

      Full documentation: https://github.com/huyz0/lsp-cli-rust
    EOS
  end

  test do
    system "#{bin}/lsp", "--help"
  end
end
