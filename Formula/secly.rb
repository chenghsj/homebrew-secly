class Secly < Formula
  desc "Standalone local UI for managing GitHub repository variables"
  homepage "https://github.com/chenghsj/secly"
  url "https://github.com/chenghsj/secly/releases/download/v0.1.1/secly-0.1.1-standalone.tar.gz"
  version "0.1.1"
  sha256 "719f8d2ad432ee8600ad2d4f982d5878985384e6f22dbd1a5432e94f8cafc6d8"

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
