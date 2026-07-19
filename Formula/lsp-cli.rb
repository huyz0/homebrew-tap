class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli"
  version "0.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "a43bb6ae6d27564083aea64b326a63582cb1a2095bfa86cca724ca901a3b18c4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "16fd9026dd9132416ba1e43e4d21abf8aa54ac0c3e99edd27d5ccc2d76088fab"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "893797696637e42f8944305c276144b97b73acbd4f15c5ecf9de151069a4aa7d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.0/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4ac6aaf2c1a557faf77ab0fe962ef3ec695e7722e60c4b87d180ba4016c64fa7"
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
