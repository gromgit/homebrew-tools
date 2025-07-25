class Jf < Formula
  desc "JSON object formatter, printf-style"
  homepage "https://github.com/sayanarijit/jf"
  url "https://github.com/sayanarijit/jf/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "909d3bc0b4e6c580b2ca811da821fa0b5ee025f85d7ba08d0f9fcea634187a8e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match '{"foo":"bar","biz":"baz"}',
                 shell_output("#{bin}/jf '{%q: %(value=default)q, %(bar)**q}' foo value=bar bar=biz bar=baz")
  end
end
