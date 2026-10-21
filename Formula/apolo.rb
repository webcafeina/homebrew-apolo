# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.14.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.14.0/apolo-cli-0.14.0-macos-universal.tar.gz"
    sha256 "9896e38d38631fca7050b68154acbca5c192cf172f659a853329126370f0fdfc"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.14.0/apolo-cli-0.14.0-linux-amd64.tar.gz"
      sha256 "e096294a085e17309a217067b398905d4763f3d01d6d18bd20a139edcec1cadd"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.14.0/apolo-cli-0.14.0-linux-arm64.tar.gz"
      sha256 "58d37dfd2f3f565acc534cf70469d6ceb24dc67bba0f9c04f45641463a629aeb"
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
