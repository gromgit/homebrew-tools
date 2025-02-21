class Nsxiv < Formula
  desc "Neo Simple X Image Viewer"
  homepage "https://nsxiv.codeberg.page/"
  url "https://codeberg.org/nsxiv/nsxiv/archive/refs/tags/v33.tar.gz"
  sha256 "7562af026024c28a93f5ca0cefd170c6b139cf2974165bcd695932d2cd9345c5"
  license "GPL-2.0-or-later"
  head "https://codeberg.org/nsxiv/nsxiv.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/gromgit/tools"
    rebuild 1
    sha256 cellar: :any,                 arm64_sonoma: "560437f950ad608763afc075e901199257586ef2d05d46d2ff49bf2492d9b468"
    sha256 cellar: :any,                 ventura:      "cc1ab0fc81b7db8c75a8b729a36b50fd8d5347a54bf88c70d00303c79bec1ec2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "291482f86e15e9fd880e0674103b313a5affb34e768480b9937120404c15d508"
  end

  depends_on "giflib"
  depends_on "imlib2"
  depends_on "libexif"
  depends_on "libx11"
  depends_on "libxft"
  depends_on "webp"

  on_ventura :or_older do
    depends_on "fontconfig"
  end

  on_linux do
    depends_on "inotify-tools"
  end

  def install
    make_args = [
      "PREFIX=#{prefix}",
      "CPPFLAGS=-I#{Formula["freetype2"].opt_include}/freetype2",
      "LDLIBS=-lpthread",
    ]
    make_args << "HAVE_INOTIFY=0" if OS.mac?
    system "make", *make_args, "install"
  end

  test do
    assert_match "Error opening X display", shell_output("DISPLAY= #{bin}/nsxiv #{test_fixtures("test.png")} 2>&1", 1)
  end
end
