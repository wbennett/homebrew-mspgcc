require 'formula'

class Msp430Libc < Formula
  homepage 'http://mspgcc.sourceforge.net'
  url 'https://sourceforge.net/projects/mspgcc/files/msp430-libc/msp430-libc-20120716.tar.bz2'
  sha1 '2ab5be8e645a5e96f64de9dd45ce96d129180ed1'

  depends_on 'wbennett/mspgcc/msp430-gcc'
  depends_on 'wbennett/mspgcc/msp430-mcu'

  def install
    # When building, we need to have the "msp430/bin" directory on the path.
    # This is because, even when we invoke msp430-gcc, it goes looking for a
    # binary called "as". If we don't do this, then it will find the system
    # (i.e., x86) as.
    binutils = Formula.factory('wbennett/mspgcc/msp430-binutils')
    gcc = Formula.factory('wbennett/mspgcc/msp430-gcc')
    msppath = "#{binutils.opt_prefix}/msp430/bin:#{gcc.opt_prefix}/msp430/bin"
    Dir.chdir 'src' do
      system "env", "PATH=#{msppath}:#{ENV['PATH']}", "make"
      system "make", "PREFIX=#{prefix}", "install"
    end
  end
end
