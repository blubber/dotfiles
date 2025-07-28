defmodule Foo do
  defstruct [:foo]

  def bar() do
    %__MODULE__{bar: "bar"}
  end
end
