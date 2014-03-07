require 'formula'

class Mspgdb_patch < Formula
    homepage 'http://mspgcc.sourceforge.net'
    url 'http://downloads.sourceforge.net/project/mspgcc/Patches/gdb-7.2a/msp430-gdb-7.2a-20111205.patch'
        :using => :nounzip
    sha1 'd84c029a914a9e43533fb8afefb4db6061e007f4'
end

class Msp430gdb < Formula
  homepage 'http://mspgcc.sourceforge.net'
  url 'http://ftpmirror.gnu.org/gdb/gdb-7.2a.tar.bz2'
  sha1 '14daf8ccf1307f148f80c8db17f8e43f545c2691'
  env :std

  def patches
    #install the patch
    Mspgdb_patch.new.brew do
        buildpath.install 'msp430-gdb-7.2a-20111205.patch'
    end

    "msp430-gdb-7.2a-20111205.patch"
  end

  def install
    cc = ENV['HOMEBREW_CC']
    if cc == nil or cc == ""
      cc = 'gcc'
    end
    cxx= ENV['HOMEBREW_CXX']
    if cxx == nil or ccx == ""
      cxx = 'g++'
    end
    mkdir 'build' do
        system "../configure",
                "--target=msp430",
                "--program-prefix='msp430-'",
                "--prefix=#{prefix}"
        system "export CC=#{cc}","export CXX=#{cxx}","make"
        system "make install"
    end
  end
end
