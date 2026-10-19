class Weatherpin < Formula
  desc "Pin any place to GNOME Weather by typing its name"
  homepage "https://github.com/e1dred/weatherpin"
  url "https://github.com/e1dred/weatherpin/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2c2557937f498fa483afe19bd22a1c072e089b408e834522074f12e5c53dc925"
  license "0BSD"

  depends_on "jq"
  depends_on :linux

  def install
    bin.install "weatherpin"
  end

  def caveats
    <<~EOS
      weatherpin needs GNOME Weather (native or Flatpak) and your system's
      gsettings. Run `weatherpin --check` to verify.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/weatherpin --version")
  end
end
