require 'formula'

class MspDebug < Formula
    homepage 'http://mspgcc.sourceforge.net'
    url 'http://sourceforge.net/projects/mspdebug/files/mspdebug-0.19.tar.gz'
    sha1 '329ad2c4cd9496dc7d24fccd59895c8d68e2bc9a'
    env :std

    def patches
    end

    def install
        cc = ENV['HOMEBREW_CC']
        unless cc.nil?
        cc = 'gcc'
        end
        cxx= ENV['HOMEBREW_CXX']
        unless cxx.nil?
        cxx = 'g++'
        end

        system "CC=#{cc}","CXX=#{cxx}","make"
        system "make install"
    end
end
