# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.15.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.15.0/apolo-cli-0.15.0-macos-universal.tar.gz"
    sha256 "ff6a181236956f2285ac365c05cfbaab590f29b5bf00a16017250196a0e6ad4e"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.15.0/apolo-cli-0.15.0-linux-amd64.tar.gz"
      sha256 "25ecd9f98f5226f3c4f2ee198ed2d08442b4094f50a822d12b5cba7af23818e2"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.15.0/apolo-cli-0.15.0-linux-arm64.tar.gz"
      sha256 "dd35a499d849e7b502ed0ed007b1ac735a7a85203d4272668bc0f3418a9f5440"
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
