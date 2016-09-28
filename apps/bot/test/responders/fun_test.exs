defmodule App.Bot.Responders.FunTest do
  # See Hedwig pkg for details
  use Hedwig.RobotCase
  require IEx

  @responders [{Bot.Responders.Fun, []}]
  @bot_name "kitt"

  # Same setup as Hedwig pkg for testing
  @tag start_robot: true, name: @bot_name, responders: @responders
  test "responds to a question about calling user michael", %{adapter: adapter, msg: msg} do
    reply = "testuser: Because that's your name...Michael"

    send adapter, {:message, %{msg | text: "kitt why do you keep calling me Michael?}"}}
    assert_receive {:message, %{text: reply}}
  end
end
