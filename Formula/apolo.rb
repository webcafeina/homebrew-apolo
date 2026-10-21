# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.14.1"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.14.1/apolo-cli-0.14.1-macos-universal.tar.gz"
    sha256 "8ab531c5dab60db44bdef3c27a2508bb49c4e4e761898aa02b7ced5a6dd099db"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.14.1/apolo-cli-0.14.1-linux-amd64.tar.gz"
      sha256 "bb9214dfa1faf7c8c5dd6f966141307844de1e4fc67ad9f625becbad44696635"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.14.1/apolo-cli-0.14.1-linux-arm64.tar.gz"
      sha256 "49f4e4e2f1548c0ce2c63019380da5d86a00b279471d70dff2bcc8d8b95ab148"
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
