class ColorCode < Formula
  desc "Free advanced MasterMind clone"
  homepage "http://colorcode.laebisch.com/"
  url "http://colorcode.laebisch.com/download/ColorCode-0.8.7.tar.gz"
  sha256 "10d6bb0ab532e603c30caf7fafc5541fa1de5c31f2e154ebc6e1bed410de182a"
  license "GPL-3.0-or-later"

  livecheck do
    url "http://colorcode.laebisch.com/download"
    regex(/href=.*?ColorCode[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    rebuild 1
    sha256 cellar: :any,                 arm64_sonoma:   "bdc5ab8ce45f2ee9d2e2f469a895cf538c0595261a5911ebbeda1aa533a2a03c"
    sha256 cellar: :any,                 arm64_ventura:  "6edce11909c604ec73a674545bbc5f52aef25a5d8bddf4ef2a1b185482204958"
    sha256 cellar: :any,                 arm64_monterey: "cb5165201a0c376af40363735728829192ceddf00a37a23d9496f9a1079ff4d2"
    sha256 cellar: :any,                 arm64_big_sur:  "230e39299a0ac01dd732121694f21b4810be03d1606395c55117277e94a727e1"
    sha256 cellar: :any,                 sonoma:         "c3119cf668cd7cd4ea184ea24d08b1c8788d8ea2a2abe674d5fe027b24f8f49b"
    sha256 cellar: :any,                 ventura:        "453cf1ef4b99c3a1236d531aafe7d17e2fc958791e0f9abdb7f45c0a47281ebd"
    sha256 cellar: :any,                 monterey:       "6303d0e13b8ca60ba2da4885d755d8e90b0b140add503018f57c549c45079626"
    sha256 cellar: :any,                 big_sur:        "b343754e096af4d184b860a0e30a5dc2ed3d8f973bbecd8e0a64ec2c0371dc53"
    sha256 cellar: :any,                 catalina:       "3ec0f990d19f9d9162896a1f0806f314dad5925346ef48eda9ce500b3a73435e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "49bf9128a81486c66e92b0382a448a970b20c32a01d296aaeeca8d1a9c4995c2"
  end

  depends_on "cmake" => :build
  depends_on "qt@5"

  fails_with gcc: "5"

  def install
    system "cmake", "-S", "src", "-B", "build_cmake", *std_cmake_args
    system "cmake", "--build", "build_cmake"
    bin.install "build_cmake/colorcode"
  end

  test do
    # We cannot write a more substantial test because executing the binary
    # opens a GUI, which is not supported by Homebrew's test environment
    system "#{bin}/colorcode", "-h"
  end
end
