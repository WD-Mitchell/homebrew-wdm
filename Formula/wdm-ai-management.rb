include Language::Python::Virtualenv

class WdmAiManagement < Formula
  desc "Manage AI agents, skills, MCP servers, rules, workflows, hooks, and harnesses"
  homepage "https://github.com/WD-Mitchell/WDM-AI-Management"
  url "https://github.com/WD-Mitchell/WDM-AI-Management/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "c4f72ad6a29901306922f0593f11865afbd0e2f041feefd0744e29ce177ebe94"
  license "MIT"

  depends_on "python@3.14"

  resource "PyYAML" do
    url "https://github.com/WD-Mitchell/WDM-AI-Management/archive/refs/tags/v1.1.2.tar.gz"
    sha256 "c4f72ad6a29901306922f0593f11865afbd0e2f041feefd0744e29ce177ebe94"
  end

  def install
    libexec.install Dir["*"]
    venv = virtualenv_create(libexec/"venv", "python3.14")
    venv.pip_install resources

    (bin/"wdm-ai").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}:$PYTHONPATH"
      exec "#{libexec}/venv/bin/python" "#{libexec}/bin/wdm-ai" "$@"
    EOS
  end

  def post_install
    system bin/"wdm-ai", "bootstrap", "--quiet"
  end

  test do
    system bin/"wdm-ai", "--help"
  end
end
