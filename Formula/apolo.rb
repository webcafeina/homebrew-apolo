# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer CLI and MCP server: lighter images, just as good"
  homepage "https://apolo.webcafeina.com/"
  version "1.0.2"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v1.0.2/apolo-cli-1.0.2-macos-universal.tar.gz"
    sha256 "0a9941daba67c61c958f832c2c47b6863ce3dafa419c5186aae633401a9ae845"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v1.0.2/apolo-cli-1.0.2-linux-amd64.tar.gz"
      sha256 "f455f20c0cbe662ccbc480baf8a415623307d378b34a0b278cf2dcf3f3e62a90"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v1.0.2/apolo-cli-1.0.2-linux-arm64.tar.gz"
      sha256 "5464748b912c343a10efd5532a497b73e65ae52df5c3da915fd2fa0796c9390d"
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
