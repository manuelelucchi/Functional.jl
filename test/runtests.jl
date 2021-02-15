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

allPairs_test() = F.allPairs([1,2], [1,2]) |> F.equals([(1, 1), (1, 2), (2, 1), (2, 2)])

any_test() = ([1,2,3,4] |> F.any(x -> x == 3)) == true

any2_test() = (([1,2,3,4], [1,3,4,5]) |> F.any2((x, y) -> x == y)) == true

avg_test() = ([1,2,3] |> F.avg) == 2

averageBy_test() = [0,1,2] |> F.averageBy(x -> x + 1) |> F.equals(2)

chunkBySize_test() = [1,2,3,4,5,6,7] |> F.chunkBySize(2) |> F.equals([[1,2],[3.4], [5,6], [7]])

concat_test() = ([1,2], [3,4]) |> F.concat |> F.equals([1,2,3,4])

contains_test_1() = ([1,2,3] |> F.contains(1)) == true

contains_test_2() = ([TestStruct(1, ""), TestStruct(2, "")] |> F.contains(x -> x.x == 1)) == true

countBy_test() = [1,2,3,4] |> F.countBy(x -> x > 2) |> F.equals(2)

distinct_test() = [1,2,3,2] |> F.distinct |> Set |> F.equals(Set([1,2,3]))

distinctBy_test() = [TestStruct(1, ""), TestStruct(2, ""), TestStruct(2, "")] |> F.distinctBy(x -> x.x) |> Set |> F.equals(Set([TestStruct(1, ""), TestStruct(2, "")]))

enumerate_test() = ["a", "b", "c"] |> F.enumerate |> F.equals([(1, "a"), (2, "b"), (3, "c")])

empty_test() = ([] |> F.empty) == true

equals_test() = (3 |> F.equals(3)) == true

except_test() = [1,2,3,4] |> F.except([1,2]) |> F.equals([3,4])

filter_test() = [1,2,3,4] |> F.filter(x -> x > 2) |> F.equals([3,4])

find_test() = [1,2,3,4] |> F.find(x -> x >= 3) |> F.equals(3)

findBack_test() = [1,2,3,4] |> F.findBack(x -> x >= 3) |> F.equals(4)

findIndex_test() = [1,2,3,4] |> F.findIndex(x -> x >= 3) |> F.equals(3)

findIndexBack_test() = [1,2,3,4] |> F.findIndexBack(x -> x >= 3) |> F.equals(4)
 
init_test() = F.init(3, i -> i - 1) |> F.equals([0,1,2])

item_test() = [1,2,3,4] |> F.item(3) |> F.equals(3)

#= 
iter_test() = nothing

iteri_test() = nothing

iter2_test() = nothing

iteri2_test() = nothing =#

map_test() = [1,2,3] |> F.map(x -> 2 * x) |> F.equals([2,4,6])

map2_test() = ([1,2,3], [2,3,4]) |> F.map2((x, y) -> y - x) |> F.equals([1,1,1])

map3_test() = ([1,2,3], [3,2,1], [4,4,4]) |> F.map3((x, y, z) -> x + y - z) |> F.equals([0,0,0])

mapFold_test() = [1,2,3] |> F.mapFold((x, s) -> (x + 1, s + x), 0) |> F.equals(([2,3,4], 6))

mapFoldBack_test() = [1,2,3] |> F.mapFoldBack((x, s) -> (x + 1, s + x), 0) |> F.equals(([2,3,4], 6))

mapi_test() = [1,2,3] |> F.mapi((i, x) -> x + i) |> F.equals([2,4,6])

mapi2_test() = ([1,1,1], [1,1,1]) |> F.mapi2((i, x, y) -> i + x + y) |> F.equals([3,4,5])

mapi3_test() = ([1,1,1], [1,1,1], [1,1,1]) |> F.mapi3((i, x, y, z) -> i + x + y + z) |> F.equals([4,5,6])

max_test() = [1,2,3] |> F.max |> F.equals(3)

maxBy_test() = ["a", "ab", "abc"] |> F.maxBy(length) |> F.equals(3)

min_test() = [1,2,3] |> F.min |> F.equals(1)

minBy_test() = ["a", "ab", "abc"] |> F.minBy(length) |> F.equals(1)

#= join_test() = (["a", "b", "c"] |> F.join(",")) == "a,b,c"
sum_test() = ([1,2,3,4] |> F.sum) == 10

take_test() = ([1,2,3] |> F.take(2) |> collect) == [1,2]
takewhile_test() = ([1,2,3,4] |> F.takewhile(x -> x < 3) |> collect) == [1,2]

skip_test() = ([1,2,3] |> F.skip(2) |> collect) == [3]
skipwhile_test() = ([1,2,3,4] |> F.skipwhile(x -> x < 3) |> collect) == [3,4]

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

    @test chunkBySize_test()

    @test concat_test()

    @test contains_test_1()
    @test contains_test_2()

    @test countBy_test()

    @test distinct_test()

    @test distinctBy_test()

    @test enumerate_test()

    @test empty_test()

    @test equals_test()

    @test except_test()

    @test filter_test()

    @test find_test()

    @test findBack_test()

    @test findIndex_test()

    @test findIndexBack_test()

    @test init_test()

    @test item_test()

    @test map_test()

    @test map2_test()

    @test map3_test()

    @test mapFold_test()

    @test mapFoldBack_test()

    @test mapi_test()

    @test mapi2_test()

    @test mapi3_test()

    @test max_test()

    @test maxBy_test()

    @test min_test()

    @test minBy_test()
    
    #= @test join_test()
    @test sum_test()
    
    @test take_test()
    @test takewhile_test()

    @test skip_test()
    @test skipwhile_test()

    
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