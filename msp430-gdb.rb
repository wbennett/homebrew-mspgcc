require 'formula'

class Msp430Libc < Formula
  homepage 'http://mspgcc.sourceforge.net'
  url 'http://ftpmirror.gnu.org/gdb/gdb-7.2a.tar.bz2'
  sha1 '14daf8ccf1307f148f80c8db17f8e43f545c2691'

  depends_on 'msp430-gcc'
  depends_on 'msp430-mcu'

  def install
  end
end
