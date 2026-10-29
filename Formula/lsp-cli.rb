class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli"
  version "0.4.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.0/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "90b050c86740f4a0017f50e71962c7baaf4adc93ce308a1abceb393eb5f7b026"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.0/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "f4af732119328ffa958c0a5009e6445341e6f58aa290457c37fa8221f8868875"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.0/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8091926e635bd80717e8f40d85ca77e574c9c5217ced03b5c9a911e487018c43"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.4.0/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "af3915a9b5e72e25d88ded32b1a14f711b92ce09287f548bc1cc3f8c13cb0103"
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
