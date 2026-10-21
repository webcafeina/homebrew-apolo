# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.12.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.12.0/apolo-cli-0.12.0-macos-universal.tar.gz"
    sha256 "c5e6431a6574cc5ed20353c1dc1cb1fba72aa56861eb71e536c3f94c19e66203"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.12.0/apolo-cli-0.12.0-linux-amd64.tar.gz"
      sha256 "5795d7a67b7318fe0fcc2ccfcf7b60adcd03757431f014b0892dea4446e95f3b"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.12.0/apolo-cli-0.12.0-linux-arm64.tar.gz"
      sha256 "4971705ba4ebc7e948cee4aeddad7f536461e88593a9982d0de63c5b7718cbca"
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
