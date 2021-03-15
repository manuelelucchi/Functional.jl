import Base

# Apply

const apply = nothing # iter

# All

all(f::Function) = c -> c |> map(f) |> Base.all

all2(f::Function) = c -> c |> map2(f) |> Base.all

# allpairs

function allpairs(a, b)
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

allpairs(c) = allpairs(c...)

# Any

any(f::Function) = c -> c |> map(f) |> Base.any

any2(f::Function) = function (c)
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

# averageby

averageby(f::Function) = c -> c |> map(f) |> avg

const avgby = averageby

# Choose

choose(f::Function) = nothing

# chunkbysize 

chunkbysize(n::Int) = function (c)
    l = length(c)
    m = Int(trunc(l / n))
    A = Vector{Any}(undef, m)
    for i = 1:m
        # N = Base.slice(c, ((i - 1) * n + 1):(i * n), :) |> Base.collect
        # A[i] = N
    end
    A
end

# comparewith

comparewith(f::Function) = nothing

# Concat 

concat(c::Tuple) = concat(c...)

concat(c...) = Base.vcat(c...)

# Contains 

contains(e) = c -> c |> any(x -> x == e)

contains(f::Function) = c -> c |> any(f)

# countby 

countby(f::Function) = d -> d |> filter(f) |> length

# Distinct

distinct(c) = c |> distinctby(x -> x)

# distinctby

distinctby(f::Function) = function (c)
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

equals(e) = v -> Base.collect(v) == Base.collect(e)

# Except

except(v) = c -> c |> filter(x -> x ∉ v)

# Exists 

const exists = any

const exists2 = any2

# Filter

filter(f::Function) = c -> Base.filter(f, c)

# Find

find(f::Function) = c -> c |> filter(f) |> first

# findback 

findback(f::Function) = c -> c |> filter(f) |> last

# findindex

findindex(f::Function) = c -> c |> enumerate |> filter(x -> f(x[2])) |> first |> x -> x[1]

# findindexback 

findindexback(f::Function) = c -> c |> enumerate |> filter(x -> f(x[2])) |> last |> x -> x[1]

# First 

const first = Base.first

first(f::Function) = find(f)

# Fold

fold(f::Function, state) = nothing

fold2(f::Function, state) = nothing

# foldback 

foldback(f::Function, state) = nothing

foldback2(f::Function, state) = nothing

# Fold Right

foldright(f::Function) = c -> Base.foldr(f, c)

# Fold Left

foldleft(f::Function) = c -> Base.foldl(f, c)

# ForAll

const forAll = nothing # iter

# groupby

groupby(f::Function) = function (c)
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

function init(n, f::Function)
    A = Vector{Any}(undef, n)
    for i = 1:n
        A[i] = f(i)
    end
    A
end

init(f::Function) = n -> init(n, f)

# isempty

const isempty = empty

# Item

item(i::Int) = c -> c[i]

# Iter

iter(f::Function) = c -> begin
    for e ∈ c 
        f(e)
    end
end

iter2(f::Function) = function (c)
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

iteri(f::Function) = function (c)
    n = length(c)
    for i = 1:n
        f(i, c[i])
    end
end

iteri2(f::Function) = function (c)
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

map2(f::Function) = function (c)
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

map3(f::Function) = function (s)
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

# mapfold

mapfold(f::Function, s) = function (c)
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

# mapfoldback

mapfoldback(f::Function, s) = function (c)
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

mapi(f::Function) = function (c)
    n = length(c)
    A = Vector{Any}(undef, n)
    for i = 1:n
        A[i] = f(i, c[i])
    end
    A
end

mapi2(f::Function) = function (c)
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

mapi3(f::Function) = function (s)
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

# maxby

maxby(f::Function) = c -> Base.Iterators.maximum(f, c)

# Min

min(c) = Base.Iterators.minimum(c)

# Minby

minby(f::Function) = c -> Base.Iterators.minimum(f, c)

# Pairwise

function pairwise(c)
    n = length(c)
    V = Vector{Any}(undef, n - 1)
    for i = 1:(n - 1)
        V[i] = (c[i], c[i + 1])
    end
    V
end

# Partition

partition(f::Function) = c -> begin
    A = []
    B = []
    (A, B)
end

# Permute

permute(f::Function) = c -> begin
    A = []
    A
end

# Pick

pick(f::Function) = c -> begin
    nothing
end

# Print

function print(c)
    Base.print(c)
    c
end

# Range

const range = Base.range

# Reduce

reduce(f::Function) = c -> Base.reduce(f, c)

# Reduceback

reduceback(f::Function) = c -> begin
    
end

# Repeat

const repeat = Base.repeat

# Replicate

const replicate = Base.repeat

# Reverse

const reverse = Base.Iterators.reverse

const rev = reverse

# Scan

scan(f::Function, state) = c -> nothing

# Scanback

scanback(f::Function, state) = c -> nothing

# Singleton

singleton(value) = [value]

# Skip

skip(n::Int) = c -> Base.Iterators.drop(c, n)

# Skipwhile

skipwhile(f::Function) = c -> Base.Iterators.dropwhile(f, c)

# Sort

sort(c) = nothing

# Sortby

sortby(f::Function) = nothing

# SortbyDescending

sortbydescending(f::Function) = nothing

# SortDescending

sortdescending(f::Function) = nothing

# Sort with

sortwith(f::Function) = nothing

# Split At

splitat(i) = x -> nothing

# Unzip

unzip(c) = Base.map(f -> getfield.(c, f), fieldnames(eltype(c)))

# Tail 

tail(c) = c |> skip(1)

# Take

take(n::Int) = c -> Base.Iterators.take(c, n)

# Take while

takewhile(f::Function) = c -> Base.Iterators.takewhile(f, c)

# Zip

zip(c::Tuple) = zip(c...)

zip(c...) = Base.zip(c...)




# Sum

sum(c) = c |> reduce(+)

# Mul

mul(c) = c |> reduce(*)

# Join

join(delim) = c -> Base.join(c, delim)

# Merge 

merge(f::Function) = c -> begin
end


