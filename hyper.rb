require 'formula'

class Hyper < Formula
  homepage ''
  url "http://www-db.in.tum.de/~muehe/files/hyper-0.1.tar.gz"
  md5 "ab7cf30719b2a5b8950ad48e2d37caa0"

  depends_on "llvm"
  depends_on "gcc"
  depends_on "ld64"
  depends_on "clang-as-wrapper"

  def install
    bin.install "hyper"
  end

  def test
    system "false"
  end
end
