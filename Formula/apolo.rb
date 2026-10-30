# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer CLI and MCP server: lighter images, just as good"
  homepage "https://apolo.webcafeina.com/"
  version "1.0.1"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v1.0.1/apolo-cli-1.0.1-macos-universal.tar.gz"
    sha256 "301814a6c5e727a772ee488405f773ba76ed9337ec81aed3224c638d329b1500"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v1.0.1/apolo-cli-1.0.1-linux-amd64.tar.gz"
      sha256 "c888623aacf451fe4ecb79714944b09227f5b82e3813d214430b2ba2f5946415"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v1.0.1/apolo-cli-1.0.1-linux-arm64.tar.gz"
      sha256 "7c4656a31fe9b104e6b31411240060e75ad03472fe6d265e940ee007d076ebe8"
    end
  end

  def install
    bin.install "apolo", "apolo-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/apolo --version")
    assert_match version.to_s, shell_output("#{bin}/apolo-mcp --version 2>&1")
  end
end
