class DvrScan < Formula
  include Language::Python::Virtualenv

  desc "Extract scenes with motion from videos"
  homepage "https://www.dvr-scan.com/"
  url "https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v1.7-release.tar.gz"
  sha256 "7e1d291df6184dab8fbd79e2639c90f8b2fe4f8c5c73265ed39f03f79b3167dd"
  license "BSD-2-Clause"

  depends_on "pkgconf" => :build
  depends_on "ffmpeg"
  depends_on "opencv"
  depends_on "python@3.13"

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
  end

  resource "cython" do
    url "https://files.pythonhosted.org/packages/5a/25/886e197c97a4b8e254173002cdc141441e878ff29aaa7d9ba560cd6e4866/cython-3.0.12.tar.gz"
    sha256 "b988bb297ce76c671e28c97d017b95411010f7c77fa6623dd0bb47eed1aee1bc"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/fb/90/8956572f5c4ae52201fdec7ba2044b2c882832dcec7d5d0922c9e9acf2de/numpy-2.2.3.tar.gz"
    sha256 "dbdc15f0c81611925f382dfa97b3bd0bc2c1ce19d4fe50482cb0ddc12ba30020"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/13/fc/128cc9cb8f03208bdbf93d3aa862e16d376844a14f9a0ce5cf4507372de4/platformdirs-4.3.6.tar.gz"
    sha256 "357fb2acbc885b0419afd3ce3ed34564c13c9b95c89360cd9563f73aa5e2b907"
  end

  resource "pyobjc-core" do
    url "https://files.pythonhosted.org/packages/5c/94/a111239b98260869780a5767e5d74bfd3a8c13a40457f479c28dcd91f89d/pyobjc_core-11.0.tar.gz"
    sha256 "63bced211cb8a8fb5c8ff46473603da30e51112861bd02c438fbbbc8578d9a70"
  end

  resource "pyobjc-framework-cocoa" do
    url "https://files.pythonhosted.org/packages/c5/32/53809096ad5fc3e7a2c5ddea642590a5f2cb5b81d0ad6ea67fdb2263d9f9/pyobjc_framework_cocoa-11.0.tar.gz"
    sha256 "00346a8cb81ad7b017b32ff7bf596000f9faa905807b1bd234644ebd47f692c5"
  end

  resource "scenedetect" do
    url "https://files.pythonhosted.org/packages/ef/4e/2f20c616b3dc8420dcc456fd1a0efee35e34f3e499843e22a2661e11f73d/scenedetect-0.6.5.2.tar.gz"
    sha256 "cf1af517409ac7b98905d8962de4fbefad01684355d12b5ccb992cbc6c4f8a52"
  end

  resource "screeninfo" do
    url "https://files.pythonhosted.org/packages/ec/bb/e69e5e628d43f118e0af4fc063c20058faa8635c95a1296764acc8167e27/screeninfo-0.8.1.tar.gz"
    sha256 "9983076bcc7e34402a1a9e4d7dabf3729411fd2abb3f3b4be7eba73519cd2ed1"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test dvr-scan`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
