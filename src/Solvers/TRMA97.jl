function TRMA97(nlpstop::NLPStopping; kwargs...)
    T = eltype(nlpstop.pb.meta.x0)
    return TRARC(
        nlpstop;
        TR = TrustRegion(10.0),
        c = Combi(
            HessSparse,
            PDataMA97{T},
            solve_modelTRDiag,
            preprocessMA97,
            decreaseFact,
            Tparam{T}(),
        ),
        kwargs...,
    )
end
