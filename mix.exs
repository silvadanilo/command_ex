defmodule EctoCommand.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecto_command,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        coverage_report: :test,
        "ecto.migrate.test": :test,
        "ecto.reset.test": :test,
        "test.slow": :test
      ],
      deps: deps(),

      # Docs
      name: "EctoCommand",
      source_url: "https://github.com/silvadanilo/ecto_command",
      homepage_url: "https://github.com/silvadanilo/ecto_command",
      docs: [
        main: "EctoCommand", # The main page in the docs
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["sample", "lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.6"},
      {:open_api_spex, "~> 3.16"},

      # dev
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:makeup_html, ">= 0.0.0", only: :dev, runtime: false},

      # test
      {:excoveralls, "~> 0.15.3", only: [:dev, :test]}
    ]
  end
end
