using Test 

struct Poly
    coeff::Vector{Float64} # [a₀, a₁,... , aₙ]
end

import Base: iszero, ==
import Base: +, -, *

## Basic operations

function iszero(P::Poly)
    return iszero(P.coeff)
end
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

## Escritura

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



# # El algoritmo de Euclides
#
# <!-- Some introduction before -->
#
#
# ## Para números enteros

# +
function gcd(a, b)
    if iszero(b)
        return a
    else
        return gcd(b, a % b)
    end
end

@test gcd(30, 15) == 15
# -

# ## Extensión a polinomios
#
# Podemos extender `gcd` a cualquier lugar con `iszero` y `%`. 
#
# . . .
#
# Queremos ***extender*** la funciones anteriores anterior, de modo que `gcd` funcione ***sin cambios***
#
# . . .
#
# Por esto julia es uno de los lenguajes con más reciclaje de código. 
#
# Creamos una estructura para polinomios de coeficientes reales.
#
# Basta con almacenar los coeficientes.
#
# ## Añadiendo `%` a `Poly`

import Base: %
function %(a::Poly, b::Poly)
    if degree(a) < 0 # a = 0
        error("¡No dividas por 0!")
    end

    r = a             # En cada paso a = b * q + r

    while degree(r) ≥ degree(b)
        s = Poly([zeros(degree(r) - degree(b)); lead(r) / lead(b)])
        r = r - s * b
    end

    return r
end

# Se puede usar la siguiente función auxiliar

function lead(P::Poly)
    if degree(P) < 0
        return 0.0
    else
        return P.coeff[degree(P)+1]
    end
end

# . . .

# +
R = Poly([2])
Q = Poly([-3, 1])
P = Q * Q * Q + R

@test P % Q == R
# -

# ## Grand finale
#
# Lanzamos la función gcd ¡que nunca oyó hablar de polinomios! Y obtenemos 
#
# . . .

# +
Q = Poly([-3, 1])
P = Q * Q * Q

@test gcd(P, Q) == Q
