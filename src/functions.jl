import Base

# Apply

const apply = nothing # iter

# All

all(f::Function) = c -> c |> map(f) |> Base.all

all2(f::Function) = c -> c |> map2(f) |> Base.all

# AllPairs

allPairs(a, b) = begin
    n = length(a)
    m = length(b)
    A = Vector{Any}(undef, n * m)
    k = 1
    for i = 1:n
    for j = 1:m
        A[k] = (a[i], b[j])
        k += 1
    end
end
    A
end

allPairs(c) = allPairs(c...)

# Any

any(f::Function) = c -> c |> map(f) |> Base.any

any2(f::Function) = c -> begin
    (a, b) = c
    if length(a) != length(b)
    throw(ErrorException("Error different lenghts"))
end

    n = length(a)
    A = Vector{Any}(undef, n)
    for i = 1:n
    if f(a[i], b[i]) return true end
end
    return false
end

# Average

avg(c) = sum(c) / length(c)

const average = avg

# AverageBy

averageBy(f::Function) = c -> c |> map(f) |> avg

const avgBy = averageBy

# Choose

choose(f::Function) = nothing

# ChunkBySize 

chunkBySize(n::Int) = c -> begin
    l = length(c)
    m = Int(trunc(l / n))
    A = Vector{Any}(undef, m)
    for i = 1:m
        # N = Base.slice(c, ((i - 1) * n + 1):(i * n), :) |> Base.collect
        # A[i] = N
end
    A
end

# CompareWith

compareWith(f::Function) = nothing

# Concat 

concat(c::Tuple) = concat(c...)

concat(c...) = Base.vcat(c...)

# Contains 

contains(e) = c -> c |> any(x -> x == e)

contains(f::Function) = c -> c |> any(f)

# CountBy 

countBy(f::Function) = d -> d |> filter(f) |> length

# Distinct

distinct(c) = c |> distinctBy(x -> x)

# DistinctBy

distinctBy(f::Function) = c -> begin
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

# Enumerate

enumerate(c) = Base.enumerate(c) |> collect

# Empty

const empty = Base.isempty

# Equals

equals(e) = v -> v == e

# Except

except(v) = c -> c |> filter(x -> x ∉ v)

# Exists 

const exists = any

const exists2 = any2

# Filter

filter(f::Function) = c -> Base.filter(f, c)

# Find

find(f::Function) = c -> c |> filter(f) |> first

# FindBack 

findBack(f::Function) = c -> c |> filter(f) |> last

# FindIndex

findIndex(f::Function) = c -> c |> enumerate |> filter(x -> f(x[2])) |> first |> x -> x[1]

# FindIndexBack 

findIndexBack(f::Function) = c -> c |> enumerate |> filter(x -> f(x[2])) |> last |> x -> x[1]

# First 

const first = Base.first

first(f::Function) = find(f)

# Fold

fold(f::Function, state) = nothing

fold2(f::Function, state) = nothing

# FoldBack 

foldBack(f::Function, state) = nothing

foldBack2(f::Function, state) = nothing

# Fold Right

foldRight(f::Function) = c -> Base.foldr(f, c)

# Fold Left

foldLeft(f::Function) = c -> Base.foldl(f, c)

# ForAll

const forAll = nothing # iter

# GroupBy

groupBy(f::Function) = c -> begin
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

# Head

const head = first

# Indexed

const indexed = enumerate

# Init

init(n, f::Function) = begin
    A = Vector{Any}(undef, n)
    for i = 1:n
    A[i] = f(i)
end
    A
end

init(f::Function) = n -> init(n, f)

# IsEmpty

const isEmpty = empty

# Item

item(i::Int) = c -> c[i]

# Iter

iter(f::Function) = c -> begin
    for e ∈ c 
        f(e)
    end
end

iter2(f::Function) = c -> begin
    (a, b) = c
    n = length(a)
    m = length(b)
    if n != m
    throw(ErrorException("Error"))
end
    for i = 1:n
    f(a[i], b[i])
end
end

# Iteri

iteri(f::Function) = c -> begin
    n = length(c)
    for i = 1:n
    f(i, c[i])
end
end

iteri2(f::Function) = c -> begin
    (a, b) = c
    n = length(a)
    m = length(b)
    if n != m
    throw(ErrorException("Error"))
end
    for i = 1:n
    f(i, a[i], b[i])
end
end

# Last

const last = Base.last

# LastIndex

const lastindex = Base.lastindex

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
    A
end

map3(f::Function) = s -> begin
    (a, b, c) = s
    if length(a) != length(b) != length(c)
    throw(ErrorException("Error different lenghts"))
end

    n = length(a)
    A = Vector{Any}(undef, n)
    for i = 1:n
    A[i] = f(a[i], b[i], c[i])
end
    A
end

# MapFold

mapFold(f::Function, s) = c -> begin
    n = length(c)
    A = Vector{Any}(undef, n)
    state = s
    for i = 1:n
    (new_value, new_state) = f(c[i], state)
    state = new_state
    A[i] = new_value
end
    (A, state)
end

# MapFoldBack

mapFoldBack(f::Function, s) = c -> begin
    n = length(c)
    A = Vector{Any}(undef, n)
    state = s
    for i = Iterators.reverse(1:n)
    (new_value, new_state) = f(c[i], state)
    state = new_state
    A[i] = new_value
end
    (A, state)
end

# Mapi

mapi(f::Function) = c -> begin
    n = length(c)
    A = Vector{Any}(undef, n)
    for i = 1:n
    A[i] = f(i, c[i])
end
    A
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
    A
end

mapi3(f::Function) = s -> begin
    (a, b, c) = s
    if length(a) != length(b) != length(c)
    throw(ErrorException("Error different lenghts"))
end

    n = length(a)
    A = Vector{Any}(undef, n)
    for i = 1:n
    A[i] = f(i, a[i], b[i], c[i])
end
    A
end

# Max

max(c) = Base.Iterators.maximum(c)

# MaxBy

maxBy(f::Function) = c -> Base.Iterators.maximum(f, c)

# Min

min(c) = Base.Iterators.minimum(c)

# MinBy

minBy(f::Function) = c -> Base.Iterators.minimum(f, c)

# Pairwise

pairwise(c) = nothing

# Partition

partition(f::Function) = c -> nothing

# Permute

permute(f::Function) = c -> nothing

# Pick

pick(f::Function) = c -> nothing

# Range

const range = Base.range

# Reduce

reduce(f::Function) = c -> Base.reduce(f, c)

# ReduceBack

reduceBack(f::Function) = c -> nothing

# Repeat

const repeat = Base.repeat

# Replicate

const replicate = Base.repeat

# Reverse

const reverse = Base.Iterators.reverse

const rev = reverse

# Scan

scan(f::Function, state) = c -> nothing

# ScanBack

scanBack(f::Function, state) = c -> nothing

# Singleton

singleton(value) = [value]

# Skip

skip(n::Int) = c -> Base.Iterators.drop(c, n)

# SkipWhile

skipWhile(f::Function) = c -> Base.Iterators.dropwhile(f, c)

# Sort

sort(c) = nothing

# SortBy

sortBy(f::Function) = nothing

# SortByDescending

sortByDescending(f::Function) = nothing

# SortDescending

sortDescending(f::Function) = nothing

# Sort With

sortWith(f::Function) = nothing

# Split At

splitAt(i) = x -> nothing

# Zip

zip(c::Tuple) = zip(c...)

zip(c...) = Base.zip(c...)

# Unzip

unzip(c) = Base.map(f -> getfield.(c, f), fieldnames(eltype(c)))









# Take

take(n::Int) = c -> Base.Iterators.take(c, n)

# Take While

takewhile(f::Function) = c -> Base.Iterators.takewhile(f, c)



# Tail 

tail() = c -> c |> skip(1)





# Sum

sum(c) = c |> reduce(+)

# Mul

mul(c) = c |> reduce(*)




# Avg



# Join

join(delim) = c -> Base.join(c, delim)

# Concat

# Group By



# Merge 

merge(f::Function) = c -> begin
end


