require 'formula'

class MspDebug < Formula
    homepage 'http://mspdebug.sourceforge.net'
    url 'http://sourceforge.net/projects/mspdebug/files/mspdebug-0.21.tar.gz'
    sha1 'a439acd166e90bfd19ddf2c3459eee9643e55368'
    env :std

    def patches
    end

    def install
        system "make"
        system "make install"
    end
end
