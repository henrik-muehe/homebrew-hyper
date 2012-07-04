require 'formula'

class ClangAsWrapper < Formula
  homepage ''
  url 'http://www-db.in.tum.de/~muehe/files/clang-as-wrapper-0.1.tar.gz'
  sha1 '722ca195426efa3dad0dbe03ac67d534ebed3bbf'

  def install
    bin.install "as"
  end

  def test
    system "false"
  end
end
