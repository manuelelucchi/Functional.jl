module Functional

# Functions

export all
export all2
export allpairs
export any
export any2 
export avg
export average
export avgby
export averageby
export chunkbysize
export comparewith
export concat
export contains
export countby
export distinct
export distinctby
export enumerate
export empty
export equals
export except
export exists
export exists2
export filter
export find
export findback
export findindex
export findindexback
export first
export fold
export fold2
export foldback
export foldback2
export foldright
export foldleft
export forAll
export groupby
export head
export indexed
export init
export isempty
export item
export iter
export iter2
export iteri
export iteri2
export last
export lastindex
export map
export map2
export map3 
export mapfold
export mapfoldback
export mapi 
export mapi2 
export mapi3 
export max
export maxby
export min
export minby

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

export match, default, when, or

include("matching.jl")

end # module