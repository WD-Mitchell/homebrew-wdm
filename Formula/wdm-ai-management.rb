include Language::Python::Virtualenv

class WdmAiManagement < Formula
  desc "Manage AI agents, skills, MCP servers, rules, workflows, hooks, and harnesses"
  homepage "https://github.com/WD-Mitchell/WDM-AI-Management"
  url "https://github.com/WD-Mitchell/WDM-AI-Management/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "56f9292f806f013386ff46893bf6ffdb59d796730300521fe49fac8d7fe8903c"
  license "MIT"

  depends_on "python@3.14"

  resource "PyYAML" do
    url "https://github.com/WD-Mitchell/WDM-AI-Management/archive/refs/tags/v1.1.1.tar.gz"
    sha256 "56f9292f806f013386ff46893bf6ffdb59d796730300521fe49fac8d7fe8903c"
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
