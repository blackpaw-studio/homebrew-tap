class Leo < Formula
  desc "Supervise persistent Claude Code agents with scheduling and channel plugins"
  homepage "https://github.com/blackpaw-studio/leo"
  version "0.1.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/blackpaw-studio/leo/releases/download/v0.1.0/leo_0.1.0_darwin_arm64.tar.gz"
      sha256 "038179b16bd9253c831cab7466bdc596d68adc40ff19eaad7f0ae424c57e1b49"
    end
    on_intel do
      url "https://github.com/blackpaw-studio/leo/releases/download/v0.1.0/leo_0.1.0_darwin_amd64.tar.gz"
      sha256 "f814a6c0165be9977ec9e6837432a90e8756e5a18b37a8ffddd836f6ab0a691e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/blackpaw-studio/leo/releases/download/v0.1.0/leo_0.1.0_linux_arm64.tar.gz"
      sha256 "57a9af228a3db920613e2b78ceb7ed557b0ecb23090d1a685347246c77480771"
    end
    on_intel do
      url "https://github.com/blackpaw-studio/leo/releases/download/v0.1.0/leo_0.1.0_linux_amd64.tar.gz"
      sha256 "0fcd0e889e220e24fbdffecf7c5caf42f751925bc0350e7709ba6dd4b4471473"
    end
  end

  def install
    bin.install "leo"
  end

  def caveats
    <<~EOS
      leo requires the `claude` CLI at runtime. Install it from:
        https://docs.claude.com/claude-code

      On first run, configure leo with:
        leo setup
    EOS
  end

  test do
    assert_match "leo #{version}", shell_output("#{bin}/leo version")
  end
end
