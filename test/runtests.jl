using Test

import Functional
using Functional: or, default, when
const F = Functional

struct TestStruct
    x::Int
    s::String
end

mutable struct TestMutableStruct
    x::Int
    s::String
end

all_test() = ([1,2,3,4] |> F.all(x -> x != 3)) == false

all2_test() = (([1,2], [1,2]) |> F.all2((x, y) -> x == y)) == true

allPairs_test() = Set(F.allPairs([1,2], [1,2])) == Set([(1, 1), (1, 2), (2, 1), (2, 2)])

any_test() = ([1,2,3,4] |> F.any(x -> x == 3)) == true

any2_test() = (([1,2,3,4], [1,3,4,5]) |> F.any2((x, y) -> x == y)) == true

avg_test() = ([1,2,3] |> F.avg) == 2

averageBy_test() = ([0,1,2] |> F.averageBy(x -> x + 1)) == 2

#= join_test() = (["a", "b", "c"] |> F.join(",")) == "a,b,c"
sum_test() = ([1,2,3,4] |> F.sum) == 10
enumerate_test() = (["a", "b", "c"] |> F.enumerate |> collect) == [(1, "a"), (2, "b"), (3, "c")]

take_test() = ([1,2,3] |> F.take(2) |> collect) == [1,2]
takewhile_test() = ([1,2,3,4] |> F.takewhile(x -> x < 3) |> collect) == [1,2]

skip_test() = ([1,2,3] |> F.skip(2) |> collect) == [3]
skipwhile_test() = ([1,2,3,4] |> F.skipwhile(x -> x < 3) |> collect) == [3,4]

map_test() = ([1,2,3] |> F.map(x -> 2 * x) |> collect) == [2,4,6]
zip_test() = (([1,2], ["a", "b"]) |> x -> F.zip(x) |> collect) == [(1, "a"), (2, "b")]
reverse_test() = ([1,2,3,4] |> F.reverse |> collect) == [4,3,2,1]



groupby_test() = begin
    a = TestStruct(10, "a")
    b = TestStruct(10, "b")
    c = TestStruct(11, "c")
    d = TestStruct(11, "d")
    ([a,b,c,d] |> F.groupby(e -> e.x) |> collect) == [[a,b], [c,d]]
end 

apply_test() = ([TestMutableStruct(1, "ciao"), 
                TestMutableStruct(2, "abaco")] |> F.apply(x -> x.x = 2)) === nothing =#

@testset "FunctionTests" begin
    @test all_test()

    @test all2_test()

    @test allPairs_test()

    @test any_test()

    @test any2_test() 
    
    @test avg_test()

    #= @test join_test()
    @test sum_test()
    @test enumerate_test()
    
    @test take_test()
    @test takewhile_test()

    @test skip_test()
    @test skipwhile_test()

    @test map_test()
    @test zip_test()
    @test reverse_test()

    @test any_test()

    @test groupby_test()

    @test apply_test() =#
end

matching_test() = 50 |> F.match(
    10 => 10,
    20 => 20,
    50 => 50
) == 50

matching_or_test() = 50 |> F.match(
    or(10, 20) => 10,
    or(20, 50) => 20
) == 20

matching_when_test() = 50 |> F.match(
    (50 |> when(x -> x < 50)) => 10,
    (50 |> when(x -> x >= 50)) => 20
) == 20

matching_with_default() = 50 |> F.match(
    20 => 20,
    default() => 10
)  == 10

@testset "MatchingTests" begin
    @test matching_test()
    @test matching_or_test()
    @test matching_when_test()
    @test matching_with_default()
end