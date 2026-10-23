# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
class Apolo < Formula
  desc "Image optimizer with Squoosh's engines: CLI and MCP server"
  homepage "https://apolo.webcafeina.com/"
  version "0.17.0"
  license "GPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Un binario por sistema, dentro de on_macos y on_linux. `brew style` lo marca (es una regla del
  # repositorio oficial, que compila desde el código), pero en un tap propio es lo normal y funciona:
  # la prueba del tap lo instala de verdad en macOS y Linux.

  on_macos do
    url "https://github.com/webcafeina/Apolo/releases/download/v0.17.0/apolo-cli-0.17.0-macos-universal.tar.gz"
    sha256 "dc44afc61491f53d8504f1494afd15ac30590d8f087bbc740c8b35f306bc7e41"
  end

  on_linux do
    on_intel do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.17.0/apolo-cli-0.17.0-linux-amd64.tar.gz"
      sha256 "642fb9c03f5aa7794da288702e74473325b72f08add195fd59f93b45c6fdf416"
    end
    on_arm do
      url "https://github.com/webcafeina/Apolo/releases/download/v0.17.0/apolo-cli-0.17.0-linux-arm64.tar.gz"
      sha256 "8b48c1c8c82be06507dc6dd62a5a60745ff0b938c446c2f252891f10bf804a71"
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
