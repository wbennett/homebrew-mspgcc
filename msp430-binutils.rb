require 'formula'

class Mspgcc < Formula
  homepage 'http://mspgcc.sourceforge.net'
  url ' http://downloads.sourceforge.net/project/mspgcc/mspgcc/DEVEL-4.7.x/mspgcc-20120911.tar.bz2'
  sha1 '04f5860857dbb166d997737312494018b125f4bd'
end

class Msp430Binutils < Formula
  homepage 'http://mspgcc.sourceforge.net'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.22.tar.gz'
  sha1 '0e16a7492c0a194962ecd33fc80fa53ccfec5149'

  def patches
    Mspgcc.new.brew do
      buildpath.install "msp430-binutils-2.22-20120911.patch"
    end
    "msp430-binutils-2.22-20120911.patch"
  end

  def install
    mkdir 'build' do
        system "../configure", "--target=msp430", "--program-prefix='msp430-'", "--prefix=#{prefix}"
        system "make"
        system "make install"
    end
  end
end
