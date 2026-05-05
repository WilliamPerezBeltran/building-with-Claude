defmodule Main do 
    import Math 
    a = double(2)
    c = triple(3)

    IO.inspect({a,c})
end

IO.inspect(Main.run())
IO.inspect(Main)
