# Generado por publicar.yml de webcafeina/Apolo desde empaquetado/homebrew/ (ADR 0026).
# No se edita aquí: se cambia la plantilla en Apolo.
cask "apolo" do
  version "0.18.0"
  sha256 "17b9b293e22554453953de3fdc6ef9874eec287946eec95c495632d5428e6e60"

  url "https://github.com/webcafeina/Apolo/releases/download/v#{version}/Apolo_#{version}_universal.dmg"
  name "Apolo"
  desc "Image optimizer with Squoosh's engines"
  homepage "https://apolo.webcafeina.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Apolo se actualiza sola desde la aplicación; Homebrew no tiene que hacerlo por ella.
  auto_updates true
  depends_on macos: :big_sur

  app "Apolo.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Apolo.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Apolo",
    "~/Library/Application Support/com.webcafeina.apolo",
    "~/Library/Caches/com.webcafeina.apolo",
    "~/Library/WebKit/com.webcafeina.apolo",
  ]

  caveats <<~EOS
    Apolo isn't signed or notarized by Apple. This cask removes the quarantine attribute when it
    installs it. If macOS still blocks it:
      xattr -dr com.apple.quarantine /Applications/Apolo.app
    or System Settings › Privacy & Security › "Open Anyway".
  EOS
end
