class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.0.7.tar.gz"
  sha256 "4a1c270ffcb1e5c4ed46f9785ad5bb7838b5dcde2be77c17da7ffc6c8ec16082"
  option "with-rc=", "Specify where to inject login setup (default: ~/.profile)"

  def install
    args = ["--prefix=#{prefix}"]
    rc = ARGV.value("with-rc")
    args << "--with-rc=#{rc}" if rc
    system "./configure", *args
    system "make", "install"
  end
  
  test do
    assert_match /#{version}/, shell_output("#{bin}/show_repoactions -v")
  end
end
