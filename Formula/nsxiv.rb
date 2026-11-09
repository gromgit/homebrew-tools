class Nsxiv < Formula
  desc "Neo Simple X Image Viewer"
  homepage "https://nsxiv.codeberg.page/"
  url "https://codeberg.org/nsxiv/nsxiv/archive/refs/tags/v34.tar.gz"
  sha256 "eee8e947a0a4103d41d892c8b0c5ef1e5364a29a62821aab47feeb9c71a96474"
  license "GPL-2.0-or-later"
  head "https://codeberg.org/nsxiv/nsxiv.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tools"
    sha256 cellar: :any, arm64_golden_gate: "61593aacd15bb24fafece470f2f3276eae00bb75be7d2009d54a54db13020a83"
    sha256 cellar: :any, arm64_tahoe:       "5a4aea32091408979fd4a3b2cabec6cc24aa5c92ed643b853954782ad80d5932"
    sha256 cellar: :any, arm64_sequoia:     "3bb9a9bff36b68ce81fcbfab813a87e9b25dff63203cf0ef761eff4a05fb32b8"
    sha256 cellar: :any, arm64_linux:       "276970a6a7cc5a8737e1c1f201442e3ad8d31c5f4ab730d0ae7b4a83f9f0ea94"
    sha256 cellar: :any, x86_64_linux:      "329ee83fe281a155e449e168c53e7616cc20c82ebe05917c88e7bd188813defb"
  end

  depends_on "fontconfig"
  depends_on "giflib"
  depends_on "imlib2"
  depends_on "libexif"
  depends_on "libx11"
  depends_on "libxft"
  depends_on "webp"

  on_linux do
    depends_on "inotify-tools"
  end

  def install
    make_args = [
      "PREFIX=#{prefix}",
      "CPPFLAGS=-I#{formula_opt_include("freetype2")}/freetype2",
      "LDLIBS=-lpthread",
    ]
    make_args << "HAVE_INOTIFY=0" if OS.mac?
    system "make", *make_args, "install"
  end

  test do
    assert_match "Error opening X display", shell_output("DISPLAY= #{bin}/nsxiv #{test_fixtures("test.png")} 2>&1", 1)
  end
end
