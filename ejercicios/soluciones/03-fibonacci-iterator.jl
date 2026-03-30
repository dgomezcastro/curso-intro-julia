using Test

struct Fibonacci
    # número de elementos de la sucesión a calcular
    N::Int64
end
Base.length(fib::Fibonacci) = fib.N
#= 
    Utilizaremos la representación de estados
        state = (n, fib_{n-2}, fib_{n-1})
=#

# caso base
function Base.iterate(::Fibonacci)
    return 1, (2, 0, 1)
end
# resto de casos
function Base.iterate(fib::Fibonacci, state)
    n = state[1]
    if n ≤ fib.N
        next_fib = state[2] + state[3]
        return next_fib, (n + 1, state[3], next_fib)
    else
        return nothing
    end
end

@test collect(Fibonacci(5)) == [1, 1, 2, 3, 5]

#=
    Comentario: 
    formalmente puede tomarse fib_{-1} = 1
    se puede simplificar la formulación
=#
#
# function Base.iterate(fib::Fibonacci, state=(1, 1, 0))
#     n = state[1]
#     if n ≤ fib.N
#         next_fib = state[2] + state[3]
#         return next_fib, (n + 1, state[3], next_fib)
#     else
#         return nothing
#     end
# end