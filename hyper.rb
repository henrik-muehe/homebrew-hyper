require 'formula'

class Hyper < Formula
  homepage ''
  url "http://www-db.in.tum.de/~muehe/files/hyper-0.1.tar.gz"
  md5 "ab7cf30719b2a5b8950ad48e2d37caa0"

  depends_on "llvm"
  depends_on "ld64"
  depends_on "clang-as-wrapper"

  def install
    bin.install "hyper"
  end

  def test
    system "false"
  end

  def caveats; <<-EOS.undent
      HyPer requires a recent gcc, for instance 4.7. To install this, you
      should tap into Homebrew/dupes and install gcc there. Since the installer
      seems to be broken right now, gcc is not installed automatically as
      a dependency but instead needs to be build by you using for instance:

      brew tap Homebrew/dupes
      brew install gcc --with-llvm --enable-cxx
    EOS
  end
end
