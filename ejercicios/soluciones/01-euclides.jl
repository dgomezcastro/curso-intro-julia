using Test 

struct Poly
    coeff::Vector{Float64} # [a₀, a₁,... , aₙ]
end

import Base: iszero, ==
import Base: +, -, *, %

function iszero(P::Poly)
    return iszero(P.coeff)
end

```
El grado de un polinomio \$P\$ es \$n\$ más alto tal que \$ P = a_0 + a_1 x + \cdots + a_n x^n \$ con \$a_n \ne 0\$
```
function degree(P::Poly)
    if iszero(P)
        degree = -1
    else
        k = length(P.coeff)
        while k ≥ 1 && iszero(P.coeff[k])
            k += -1
        end
        degree = k-1
    end
    return degree
end
function +(a::Poly, b::Poly)
    if iszero(a)
        return b
    elseif iszero(b)
        return a
    else
        da = degree(a)
        db = degree(b)
        return Poly(
            [a.coeff[1:da+1]; zeros(max(db - da, 0))]
            +
            [b.coeff[1:db+1]; zeros(max(da - db, 0))]
            )
    end
end
function -(a::Poly)
    return Poly(-a.coeff)
end
function -(a::Poly, b::Poly)
    return a + (-b)
end
function *(a::Poly,b::Poly)
    da = degree(a); db = degree(b);
    prodcoeffs = zeros(da+db+1);
    for k=0:(da+db)
        rangei = max(0,k-db):min(k,da)
        prodcoeffs[k+1] = sum(  a.coeff[1   .+ rangei] .*
                                b.coeff[k+1 .- rangei]);
    end
    return Poly(prodcoeffs)
end

function ==(P::Poly, Q::Poly)
    return iszero(P - Q)
end

@testset "Operations work" begin 
    P = Poly([0,1,2])
    @test P + P == Poly([0,2,4])
    @test P-P == Poly([])
    @test Poly([2])*P == P + P
end

function Base.show(io::IO,P::Poly) 
    degreeP = degree(P)
    if degreeP < 0
        text = "0"
    else
        text = "$(P.coeff[1])"
        for n = 2:degreeP + 1
            text = text * " + $(P.coeff[n])" * "x^$(n-1)"
        end
    end
    print(text)
    return nothing
end;

function my_gcd(a, b)
    if iszero(b)
        return a
    else
        return my_gcd(b, a % b)
    end
end

@test my_gcd(30, 15) == 15

function %(a::Poly, b::Poly)
    if iszero(a) 
        error("¡No dividas por 0!")
    end
    
    # En cada paso a = b * q + r
    r = a             
    while degree(r) ≥ degree(b)
        s = Poly([zeros(degree(r) - degree(b)); lead(r) / lead(b)])
        r = r - s * b
    end
    return r
end

@testset "% works" begin
    R = Poly([2])
    Q = Poly([-3, 1])
    P = Q * Q * Q + R
    @test P % Q == R
end

@testset "GCD works for polynomials" begin
    Q = Poly([-3, 1])
    P = Q * Q * Q    
    @test my_gcd(P, Q) == Q
end;
