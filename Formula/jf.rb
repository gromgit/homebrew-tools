class Jf < Formula
  desc "JSON object formatter, printf-style"
  homepage "https://github.com/sayanarijit/jf"
  url "https://github.com/sayanarijit/jf/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "fa7acd5cbe06513227a7a4ac5968cf159b742d2d89f9c90416681ce1d7ad04b3"
  license "MIT"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tools"
    sha256 cellar: :any_skip_relocation, arm64_golden_gate: "efaec6850938d87e93b36fcb196bf798cf3b4e47ac768fffa61fb6cba063daa9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:       "961050379379f12cdd8be55730da714256a54506487135f12a0b52b683db4c77"
    sha256 cellar: :any_skip_relocation, arm64_sequoia:     "e4864b06f581c535a2bca85e3671eec8cfcbb428739fa91f769f02fe30d96f4d"
    sha256 cellar: :any,                 arm64_linux:       "998fe3f0baac2175ba6226fd74bc0863199513e514d2afc050ca612b6aef0dbe"
    sha256 cellar: :any,                 x86_64_linux:      "519cdb0c08abefd5c9f77498efaa282a44868f1e77e71e22ab536adfb7d755af"
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
