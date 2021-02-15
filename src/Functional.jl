module Functional

# Functions

export all
export all2
export allPairs
export any
export any2 
export avg
export average
export avgBy
export averageBy
export chunkBySize
export compareWith
export concat
export contains
export countBy
export distinct
export distinctBy
export enumerate
export empty
export equals
export except
export exists
export exists2
export filter
export find
export findBack
export findIndex
export findIndexBack
export first
export fold
export fold2
export foldBack
export foldBack2
export foldRight
export foldLeft
export forAll
export groupBy
export head
export indexed
export init
export isEmpty
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
export mapFold
export mapFoldBack
export mapi 
export mapi2 
export mapi3 
export max
export maxBy
export min
export minBy

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