# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.18.1"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.18.1/apolo-cli-0.18.1-macos-universal.tar.gz"
    sha256 "ad4bdb353f58b6ae49bdda4d362c5bfbb83ebdae2d3c7b8684cbd34fd2e61b46"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.1/apolo-cli-0.18.1-linux-amd64.tar.gz"
      sha256 "b38e71995b29add1e7739eb20be86e01baf54c4cf1595619ed3689ea79c22f2f"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.1/apolo-cli-0.18.1-linux-arm64.tar.gz"
      sha256 "58f67395f9e249a5adec4494907842eb2df71cb65bc0d124a363d6113d176c08"
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
