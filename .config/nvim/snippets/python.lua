---@diagnostic disable: undefined-global

return {
  s(
    { trig = 'def', snippetType = 'autosnippet' },
    fmt(
      [[
        def {}({}) -> {}:
            {}
        ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    )
  ),

  s(
    { trig = 'if', snippetType = 'autosnippet' },
    fmta(
      [[
        if <>:
            <>
        ]],
      {
        i(1),
        i(2),
      }
    )
  ),

  s(
    { trig = 'try', snippetType = 'autosnippet' },
    fmta(
      [[
        try:
            <>
        except <>:
            <>
        ]],
      {
        i(1),
        i(3, ''),
        i(2, 'pass'),
      }
    )
  ),
}
