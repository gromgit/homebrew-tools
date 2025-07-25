class Jf < Formula
  desc "JSON object formatter, printf-style"
  homepage "https://github.com/sayanarijit/jf"
  url "https://github.com/sayanarijit/jf/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "909d3bc0b4e6c580b2ca811da821fa0b5ee025f85d7ba08d0f9fcea634187a8e"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tools"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "73a6ad72e3bea1cec2329074eeb57d1177ab79f87920574035bda4344c57e3a5"
    sha256 cellar: :any_skip_relocation, ventura:      "0ba4558d30627f117cb9d62308086852b63a21ffa16895e3e6e30f3cca81028d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4eaa288566b3a086f4724e73960b441f66a59e6246ebebc827ccffd2e7e5d4ec"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match '{"foo":"bar","biz":"baz"}',
                 shell_output("#{bin}/jf '{%q: %(value=default)q, %(bar)**q}' foo value=bar bar=biz bar=baz")
  end
end
