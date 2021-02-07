include("functions.jl")


or(values...) = e -> (values |> any(x -> x == e))

when(f::Function) = x -> e -> (f(e))

some() = f -> true

match(options...) = c -> begin
    for o ∈ options
        f = o.first
        s = o.second
        if match_single(f, s)
            return evaluate(s)
        end
    end
    return nothing
end

match_single(c, f::Function) = f(c)

match_single(c, e) = c == e

evaluate(f::Function) = f()

evaluate(e) = e