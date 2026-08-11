class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli"
  version "0.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.2.0/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "7e1604bd5113f9a1539ef94c2882ddc40f09b65f6d0d529a2912b1d1824a0efb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.2.0/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "d2399e2623c740aa742148ee1cd0b0620a9dfd8d2e0fa3946777be7841995908"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.2.0/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d37c24408a8c25258784c0c9312c5082fba0e0571a1102954d4acce6287a57db"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.2.0/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4d5ef9e542a4a0246427761d633d386626a5953af3b94177d79a4577664e30be"
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
