include("functions.jl")

or(values...) = e -> (values |> any(x -> x == e))

when(f::Function) = x -> e -> (f(e))

default() = f -> true

match(options...) = c -> begin
    for o ∈ options
        f = o.first
        s = o.second
        if match_single(c, f)
            return evaluate(s)
        end
    end
    return nothing
end

equals(x, y) = x == y

match_single(c, f::Function) = f(c)

match_single(c, e) = c == e

evaluate(f::Function) = f()

evaluate(e) = e