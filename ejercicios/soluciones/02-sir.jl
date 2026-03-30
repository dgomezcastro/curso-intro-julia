# https://phageontoast.wordpress.com/2024/04/11/a-julia-tutorial-the-sir-model/
# https://gist.github.com/sjbeckett/49fff432731f952ad0812dd6d4ceedfc
function SIRmodel!(du, u, p, t)
    S, I, R = u
    β, γ = p

    du[1] = -β * S * I
    du[2] = β * S * I - γ * I
    du[3] = γ * I
end

#timespan of between 0 and 100 days.
tspan = (0.0, 100.0)
#time resolution of simulation output to be recorded every 0.5 days
tres = 0.5

#disease parameters
β = 0.4 # transmission rate
γ = 0.1 # recovery rate
parameters = [β, γ]

#initial infections in population size N of 10,000
N = 10_000 #pop size
I_0 = 1 / N #initial fraction of infected population

#initialise population fractions in states S, I, R which should sum to one.
u0 = [1 - I_0, I_0, 0.0]

using DifferentialEquations

SIRproblem = ODEProblem(SIRmodel!, u0, tspan, parameters)
solveSIR = solve(SIRproblem, saveat=tres)

using Plots
#plot simulation output with line labels S, I, R
plot(solveSIR, labels=["S" "I" "R"])