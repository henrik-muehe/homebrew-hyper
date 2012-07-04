require 'formula'

class Cctools < Formula
  homepage ''
  url 'http://opensource.apple.com/tarballs/cctools/cctools-822.tar.gz'
  sha1 'bd04447522aa69c1f71ab01811ac46dca23b92b7'

  depends_on "dyld"

  def install
    system "rm -f include/mach-o/dy*"
    prefix.install Dir['include']
  end

  def test
    system "false"
  end
end
