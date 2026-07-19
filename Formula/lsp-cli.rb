class LspCli < Formula
  desc "LSP-based code navigation CLI for coding agents and humans"
  homepage "https://github.com/huyz0/lsp-cli"
  version "0.1.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.1/lsp-aarch64-apple-darwin.tar.gz"
    sha256 "71e0b2bb05c838fe04b48de993452e93209d07148de8e21bbc2b96c9bc364709"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.1/lsp-x86_64-apple-darwin.tar.gz"
    sha256 "ddf101aeef88ecdf81992f00448daeacfe4be6b5be95e46fc6b1b1b1726e7a48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.1/lsp-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "72a4d55a0470f5fbe70f2bbb3820ce280ee688bd1adbc66aee6d634785ffbeec"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/huyz0/lsp-cli/releases/download/v0.1.1/lsp-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "715e95d766b13c167dcc217b9d3db542235ee07b10e6b4301995d6c9f2a4084a"
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
