# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.18.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.18.0/apolo-cli-0.18.0-macos-universal.tar.gz"
    sha256 "1548530f766386658b8c2a90581aab4af94aebd57273a6087f79379c55eb521f"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.0/apolo-cli-0.18.0-linux-amd64.tar.gz"
      sha256 "8eb4bcbb7fcae066c149522f062ff3a22e1f37e51a469c68707041881c6a2500"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.0/apolo-cli-0.18.0-linux-arm64.tar.gz"
      sha256 "85561993ff46c06be4e250bee806dca38886c6521dcdb1badafbd324ca281d33"
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
