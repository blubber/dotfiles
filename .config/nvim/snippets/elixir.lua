---@diagnostic disable: undefined-global

return {
  s(
    { trig = ';i', snippetType = 'autosnippet' },
    fmt([[|> IO.inspect(label: "{}")]], {
      i(1, 'debug_label'),
    })
  ),
  s(
    { trig = ';hi', snippetType = 'autosnippet' },
    fmta(
      [[
        def handle_info({<>, <>}, socket) do
            <>
            {:noreply, socket}
        end
        ]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),

  s(
    { trig = ';lv', snippetType = 'autosnippet' },
    fmta(
      [[
        defmodule <>.<>Live do
            use <>, :live_view

            def render(assigns) do
            ~H"""
            <>
            """
            end
        end
        ]],
      {
        i(1),
        i(2),
        rep(1),
        i(3),
      }
    )
  ),
}
