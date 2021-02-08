import Base

# Range

const range = Base.range

# Repeat

const repeat = Base.repeat

# First

const first = Base.first

# Last

const last = Base.last

# LastIndex

const lastindex = Base.lastindex

# Empty

const empty = Base.isempty

# Reverse

const reverse = Base.Iterators.reverse

# Zip

zip(c::Tuple) = zip(c...)

zip(c...) = Base.zip(c...)

# Unzip

unzip(c) = Base.map(f -> getfield.(c, f), fieldnames(eltype(c)))

# Enumerate

enumerate(c) = Base.enumerate(c)

# Map

map(f::Function) = c -> Base.map(f, c) 

map2(f::Function) = c -> begin
    (a, b) = c
    if length(a) != length(b)
        throw(ErrorException("Error different lenghts"))
    end

    n = length(a)
    A = Vector{Any}(undef, n)
    for i = 1:n
        A[i] = f(a[i], b[i])
    end
    (A...,)
end

mapi(f::Function) = c -> begin
    n = length(c)
    A = Vector{Any}(undef, n)
    for i = 1:n
        A[i] = f(i, c[i])
    end
    (A...,)
end

mapi2(f::Function) = c -> begin
    (a, b) = c
    if length(a) != length(b)
        throw(ErrorException("Error different lenghts"))
    end

    n = length(a)
    A = Vector{Any}(undef, n)
    for i = 1:n
        A[i] = f(i, a[i], b[i])
    end
    (A...,)
end

# Filter

filter(f::Function) = c -> Base.filter(f, c)

# All

all(f::Function) = c -> c |> map(f) |> Base.all

all2(f::Function) = nothing

# Any

any(f::Function) = c -> c |> map(f) |> Base.any

any2(f::Function) = nothing

# Take

take(n::Int) = c -> Base.Iterators.take(c, n)

# Take While

takewhile(f::Function) = c -> Base.Iterators.takewhile(f, c)

# Skip

skip(n::Int) = c -> Base.Iterators.drop(c, n)

# Skip While

skipwhile(f::Function) = c -> Base.Iterators.dropwhile(f, c)

# Tail 

tail() = c -> c |> skip(1)

# Reduce

reduce(f::Function) = c -> Base.reduce(f, c)

# Fold Right

foldright(f::Function) = c -> Base.foldr(f, c)

# Fold Left

foldleft(f::Function) = c -> Base.foldl(f, c)

# Sum

sum(c) = c |> reduce(+)

# Mul

mul(c) = c |> reduce(*)

# Max

max(c) = Base.Iterators.maximum(c)

max(f::Function) = c -> Base.Iterators.maximum(f, c)

# Min

min(c) = Base.Iterators.minimum(c)

min(f::Function) = c -> Base.Iterators.minimum(f, c)

# Avg

avg(c) = sum(c) / length(c)

avg(f::Function) = c -> c |> map(f) |> avg

# Find

find(f) = x -> x |> filter(f) |> first

# Join

join(delim) = c -> Base.join(c, delim)

# Concat

concat(c::Tuple) = concat(c...)

concat(c...) = Base.vcat(c...)

# Group By

groupby(f::Function) = c -> begin
    out = Dict()
    for e ∈ c    
        k = f(e)
        l = get(out, k, nothing)
        if l === nothing
            l = []
            out[k] = l
        end
        push!(l, e)
    end
    return out |> collect |> map(e -> e[2])
end

# Merge 

merge(f::Function) = c -> begin
end

# Apply

iter(f::Function) = c -> begin
    for e ∈ c 
        f(e)
    end
end

iter2(f::Function) = nothing

iteri(f::Function) = nothing

iteri2(f::Function) = nothing

# Distinct

distinct(f::Function) = c -> begin
    out = Dict()
    for e ∈ c
        k = f(e)
        l = get(out, k, nothing)
        if l === nothing
            out[k] = e
        end
    end
    return out |> collect |> map(e -> e[2])
end