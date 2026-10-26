# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.18.2"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.18.2/apolo-cli-0.18.2-macos-universal.tar.gz"
    sha256 "5b226fe2c4c83f35f195def61a01508e1febe22a052b55e892a9e5f00d0bbd9b"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.2/apolo-cli-0.18.2-linux-amd64.tar.gz"
      sha256 "46231bca5b14d2f20a71b6c1a88778a7eb16bd7b807d4cc403fb4453dd14a55a"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.2/apolo-cli-0.18.2-linux-arm64.tar.gz"
      sha256 "64b6a236f1a942253ffaf5e4723e8eba5cf8d3c042aeb479ceb279620d741abb"
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
