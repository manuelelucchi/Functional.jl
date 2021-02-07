import Functional
using Test

const F = Functional

struct TestStruct
    x::Int
    s::String
end

join_test() = (["a", "b", "c"] |> F.join(",")) == "a,b,c"
sum_test() = ([1,2,3,4] |> F.sum) == 10
enumerate_test() = (["a", "b", "c"] |> F.enumerate |> collect) == [(1, "a"), (2, "b"), (3, "c")]

take_test() = ([1,2,3] |> F.take(2) |> collect) == [1,2]
takewhile_test() = ([1,2,3,4] |> F.takewhile(x -> x < 3) |> collect) == [1,2]

skip_test() = ([1,2,3] |> F.skip(2) |> collect) == [3]
skipwhile_test() = ([1,2,3,4] |> F.skipwhile(x -> x < 3) |> collect) == [3,4]

map_test() = ([1,2,3] |> F.map(x -> 2 * x) |> collect) == [2,4,6]
zip_test() = (([1,2], ["a", "b"]) |> x -> F.zip(x) |> collect) == [(1, "a"), (2, "b")]
reverse_test() = ([1,2,3,4] |> F.reverse |> collect) == [4,3,2,1]

all_test() = ([1,2,3,4] |> F.all(x -> x != 3)) == false
any_test() = ([1,2,3,4] |> F.any(x -> x == 3)) == true

groupby_test() = begin
    a = TestStruct(10, "a")
    b = TestStruct(10, "b")
    c = TestStruct(11, "c")
    d = TestStruct(11, "d")
    ([a,b,c,d] |> F.groupby(e -> e.x) |> collect) == [[a,b], [c,d]]
end 

@testset "Tests" begin
    @test join_test()
    @test sum_test()
    @test enumerate_test()
    
    @test take_test()
    @test takewhile_test()

    @test skip_test()
    @test skipwhile_test()

    @test map_test()
    @test zip_test()
    @test reverse_test()

    @test all_test()
    @test any_test()

    @test groupby_test()
end
