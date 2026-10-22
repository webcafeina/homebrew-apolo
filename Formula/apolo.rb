# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.16.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.16.0/apolo-cli-0.16.0-macos-universal.tar.gz"
    sha256 "47a3e05123e0030b550a93de350c8bd35309d82ebafd1dc50ab8ded711aeefe8"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.16.0/apolo-cli-0.16.0-linux-amd64.tar.gz"
      sha256 "ad247c4ea3055c17c4401f28b09ea01be9254efed3e9defb555bfef0cb4506b4"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.16.0/apolo-cli-0.16.0-linux-arm64.tar.gz"
      sha256 "abe47b5993aa63341b89f773c3d9476d10759b9d44f2cf4fa591ebee86bba3d9"
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
