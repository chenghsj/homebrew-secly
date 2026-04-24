class Secly < Formula
  desc "Standalone local UI for managing GitHub repository variables"
  homepage "https://github.com/chenghsj/secly"
  url "https://github.com/chenghsj/secly/releases/download/v0.1.2/secly-0.1.2-standalone.tar.gz"
  version "0.1.2"
  sha256 "d3d3e51b5e35afb50981c1181b36370b579edd66888531080d1b0da61c0b7324"

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

  test do
    output = shell_output("#{bin}/secly paths")
    assert_match "App data root:", output
  end
end
