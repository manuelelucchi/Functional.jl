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

map(f) = c -> Base.map(f, c) 

# Filter

filter(f) = c -> Base.filter(f, c)

# All

all(f) = c -> c |> map(f) |> Base.all

# Any

any(f) = c -> c |> map(f) |> Base.any

# Take

take(n) = c -> Base.Iterators.take(c, n)

# Take While

takewhile(f) = c -> Base.Iterators.takewhile(f, c)

# Skip

skip(n) = c -> Base.Iterators.drop(c, n)

# Skip While

skipwhile(f) = c -> Base.Iterators.dropwhile(f, c)

# Reduce

reduce(f) = c -> Base.reduce(f, c)

# Fold Right

foldright(f) = c -> Base.foldr(f, c)

# Fold Left

foldleft(f) = c -> Base.foldl(f, c)

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

groupby(f) = c -> begin
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

merge(f) = c -> begin
end

# Distinct

distinc(f) = c -> begin
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

##### TODO #####

# distinct(c)

# union(f)

# intersect

# split(f)

# permute(f)

# sort(f) 

# unfold(f)

# distinct()