module Functional

# Functions

export range, repeat, first, last, lastindex, empty, reverse
export zip, unzip
export enumerate
export map, filter
export all, any
export take, takewhile
export skip, skipwhile
export reduce, foldright, foldleft
export sum, mul
export avg, min, max
export find, join, concat

include("functions.jl")

# Matching

export match

include("matching.jl")

end # module