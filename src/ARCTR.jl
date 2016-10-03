module ARCTR
using NLPModels
#using AmplNLReader
using OptimizationProblems
using LinearOperators
using Krylov
using Profiles
using Compat
import Compat.String
# package code goes here

#using Debug

include("Includes.jl")

include("TRARC.jl")

export ARCSpectral

include("solvers.jl")

end # module
