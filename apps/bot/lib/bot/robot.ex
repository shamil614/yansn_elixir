defmodule App.Bot.Robot do
  use Hedwig.Robot, otp_app: :bot

  def after_connect(state) do
    Hedwig.Registry.register(state.name)

    {:ok, state}
  end
end
