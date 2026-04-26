class Secly < Formula
  desc "Standalone local UI for managing GitHub repository variables"
  homepage "https://github.com/chenghsj/secly"
  url "https://github.com/chenghsj/secly/releases/download/v0.1.3/secly-0.1.3-standalone.tar.gz"
  version "0.1.3"
  sha256 "6a3ebe4aef31bcb941d305ad840515ee184ba1c7a97ea75546ec24c411116ab1"

  depends_on "gh"
  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"secly").write <<~EOS
      #!/bin/bash
      exec /usr/bin/env node "#{libexec}/bin/secly.mjs" "$@"
    EOS
    chmod 0755, bin/"secly"
  end

  def caveats
    <<~EOS
      Before removing the Homebrew formula, run:
        secly uninstall --force

      Then remove the formula itself:
        brew uninstall secly
    EOS
  end

  test do
    output = shell_output("#{bin}/secly paths")
    assert_match "App data root:", output
  end
end
