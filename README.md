# Functional.jl

| License | Tests | Coverage | Docs |
| :----: | :----: | :----: | :----: |
| [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) | ![Tests](https://github.com/manuelelucchi/Functional.jl/workflows/Tests/badge.svg?branch=master) | [![codecov](https://codecov.io/gh/manuelelucchi/Functional.jl/branch/master/graph/badge.svg?token=Q1RRYNGGW2)](https://codecov.io/gh/manuelelucchi/Functional.jl) | [![Docs](https://github.com/manuelelucchi/Functional.jl/workflows/Docs/badge.svg)]() |

Functional.jl is simple library that allows you to use your functional programming skills in Julia with a dedicated set of functions

## Documentation

You can find APIs Reference, Tutorials and more in the [Official Website (Coming soon)](https://manuelelucchi.github.io/Functional.jl/dev)

## Installation

```julia
julia> import Pkg
julia> Pkg.add("Functional")
```
or

```
pkg (1.4)> add Functional
```

## Suggested use

```julia

import Functional
const F = Functional

# Then you can use every function you like!
[1,2,3] |> F.map(x -> x + 1)

```

## Contributing

Feel free to open issues, create pull requests or fork this project!
