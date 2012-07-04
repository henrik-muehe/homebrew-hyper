require 'formula'

class Dyld < Formula
  homepage ''
  url 'http://opensource.apple.com/tarballs/dyld/dyld-195.6.tar.gz'
  sha1 '1fb2d94f2902975e572d2a0b22d8bd1d1a1ac6d8'

  def install
    prefix.install Dir['include']
  end

  def test
    system "false"
  end
end
