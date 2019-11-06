# This file was generated by GoReleaser. DO NOT EDIT.
class Stripe < Formula
  desc "Stripe CLI utility"
  homepage "https://stripe.com"
  version "1.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/stripe/stripe-cli/releases/download/v1.2.0/stripe_1.2.0_mac-os_x86_64.tar.gz"
    sha256 "68201087761ecca154abf55225eeb592e15e8f7959f7f51431db4aacd8d90c4e"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-cli/releases/download/v1.2.0/stripe_1.2.0_linux_x86_64.tar.gz"
      sha256 "cb38daca7e4d6bec49d791d93c3330ddaa78073ff7b622acc884ce3c86c5bd05"
    end
  end

  def install
    bin.install "stripe"
    rm Dir["#{bin}/{stripe-completion.bash,stripe-completion.zsh}"]
    system bin/"stripe", "completion", "--shell", "bash"
    system bin/"stripe", "completion", "--shell", "zsh"
    bash_completion.install "stripe-completion.bash"
    zsh_completion.install "stripe-completion.zsh"
    (zsh_completion/"_stripe").write <<~EOS
      #compdef stripe
      _stripe () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/stripe-completion.zsh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end
end
