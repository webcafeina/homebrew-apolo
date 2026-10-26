# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.18.3"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.18.3/apolo-cli-0.18.3-macos-universal.tar.gz"
    sha256 "2302f2b2b5f56c9955c7d6e548a20bee923fee7f2e62ba0fe04598714d715ebe"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.3/apolo-cli-0.18.3-linux-amd64.tar.gz"
      sha256 "683a569e022a180fea8d1921bfd97cb51bec5f7d778be3ea12425d1dd67d91f7"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.18.3/apolo-cli-0.18.3-linux-arm64.tar.gz"
      sha256 "8858ce6fe0cbad03902c02dd6bdaa2d668e1f0adbcc1893bbbab9b89007f3d98"
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
