# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.13.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.13.0/apolo-cli-0.13.0-macos-universal.tar.gz"
    sha256 "5e5e4d8667da789ae578b3f33ecdb56431211cb3642b612614e9d58e406f9a92"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.13.0/apolo-cli-0.13.0-linux-amd64.tar.gz"
      sha256 "6945692b76f8b30325e4b280a3b3df5c228270c4222624052c08d9db6f7203b8"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.13.0/apolo-cli-0.13.0-linux-arm64.tar.gz"
      sha256 "5c673b4a5258cd28aa955943bbad20e7319fc07162fe8f365d039fca1e75a7cc"
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
