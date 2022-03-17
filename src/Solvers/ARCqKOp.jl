function ARCqKOp(nlpstop::NLPStopping, shifts = 10.0 .^ (collect(-20.0:1.0:20.0)); kwargs...)
    T = eltype(nlpstop.pb.meta.x0)

    return TRARC(
        nlpstop;
        TR = TrustRegion(10.0),
        c = Combi(
            HessOp,
            PDataKARC{T},
            solve_modelKARC,
            preprocessKARC,
            TparamsKARC{T}(shifts),
        ),
        kwargs...,
    )
end
