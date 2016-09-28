defmodule Bot.Responders.Fun do
  @moduledoc """
  Just for fun.
  """

  use Hedwig.Responder

  respond ~r/why{1}.+me|calling{1}.+michael{1}/i, msg do
    emote msg, "Because that's your name...Michael"
  end
end
