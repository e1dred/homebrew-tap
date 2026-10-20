class Weatherpin < Formula
  desc "Pin any place to GNOME Weather by typing its name"
  homepage "https://github.com/e1dred/weatherpin"
  url "https://github.com/e1dred/weatherpin/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5a3fc9c553fce91956aff673c7e9d7863e274d9a7f07c8c98ab8ab1fad690533"
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
