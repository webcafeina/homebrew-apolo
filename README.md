# Homebrew tap for Apolo

[Apolo](https://apolo.webcafeina.com) optimizes images with Squoosh's engines: WebP, AVIF, JPEG XL,
MozJPEG, OxiPNG and QOI, the same file as the official tools. ([Español](#en-español))

```sh
# The command line (apolo) and the agent server (apolo-mcp), on macOS and Linux
brew install webcafeina/apolo/apolo

# The app, on macOS 11 or later
brew install --cask webcafeina/apolo/apolo
```

Use the full name (`webcafeina/apolo/apolo`): since Homebrew 6, a third-party tap has to be trusted,
and installing by its full name trusts that package.

Apolo isn't signed or notarized by Apple: the cask removes the quarantine attribute when it installs
the app. The app updates itself; `brew upgrade` works too.

## En español

```sh
# La línea de órdenes (apolo) y el servidor para agentes (apolo-mcp), en macOS y Linux
brew install webcafeina/apolo/apolo

# La aplicación, en macOS 11 o posterior
brew install --cask webcafeina/apolo/apolo
```

Con el nombre completo: desde Homebrew 6, un tap ajeno hay que confiarlo, e instalar con el nombre
completo confía en ese paquete. Apolo no está firmada por Apple: el cask le quita la cuarentena al
instalarla.

---

Generated on each release by [webcafeina/Apolo](https://github.com/webcafeina/Apolo)
(`empaquetado/homebrew/`). Don't edit it here. GPLv3.
