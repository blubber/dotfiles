---@diagnostic disable: undefined-global

return {
  s(
    { trig = 'pdef', snippetType = 'autosnippet' },
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
    { trig = 'pif', snippetType = 'autosnippet' },
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
    { trig = 'ptry', snippetType = 'autosnippet' },
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
