require 'formula'

class Libunwind < Formula
  homepage ''
  url 'http://opensource.apple.com/tarballs/libunwind/libunwind-30.tar.gz'
  sha1 'e779fbe8a58e6cfb76798c8e9b2373a9ddc9b2eb'

  depends_on "dyld"

  def install
    prefix.install Dir['include']
    system "mkdir libunwind"
    system "mv src/*.h* libunwind/"
    include.install Dir['libunwind']
  end

  def test
    system "false"
  end
end
