---@diagnostic disable: undefined-global

return {
  s(
    { trig = 'defn', snippetType = 'autosnippet' },
    fmt(
      [[
        def {}({}) do
            {}
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
    { trig = 'handle_info', snippetType = 'autosnippet' },
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
    { trig = [[^%s*use%s*:?live_view]], snippetType = 'autosnippet', regTrig = true, wordTrig = false },
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
