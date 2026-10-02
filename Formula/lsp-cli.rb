class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli"
  version "0.3.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.3.0/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "7a0b57dc3a8a58c924921ca8680cd796d0807a900d4da54591ab3bfaa0884b5d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.3.0/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "65eb6ebaad98e35b366a24045fd0e3b1a4d79b99462fc49e3ec7fceb2fe1a9a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.3.0/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "71e5489eb6e02923b5dd432af3bfc574b74cea716a373587eca9f4e1e2a3a85e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.3.0/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "74731e10a9ff1bd65e036cc11793f9ddb790891508f046e66c774a0698793546"
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
