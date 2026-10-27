# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer CLI and MCP server: lighter images, just as good"
  homepage "https://apolo.webcafeina.com/"
  version "1.0.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v1.0.0/apolo-cli-1.0.0-macos-universal.tar.gz"
    sha256 "4d185e57db98229d954050fb97531e1970e382b519842b233649e3c0ca278816"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v1.0.0/apolo-cli-1.0.0-linux-amd64.tar.gz"
      sha256 "f92e86f1dfd81d7cb8f83ecc0097917239f16616173eccf4f970e26f5e8c23f4"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v1.0.0/apolo-cli-1.0.0-linux-arm64.tar.gz"
      sha256 "18001d0b9a155d3be0d0a7d5a0a96e25e0ab19ef54dac43d2a18c946d5c6c1d7"
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
