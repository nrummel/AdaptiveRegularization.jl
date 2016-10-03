#export ARCSpectral, ARCSpectral_abs, ARCLDLt, ARCqKOp
export solvers
# Valid combinations
#



solvers = Array(Symbol,1)


#include("ARCSpectral.jl")
#push!(solvers,fname)



fname = :ARCSpectral_abs
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs... )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataSpectral,solve_modelARCDiagAbs,preprocessSpectral,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)

        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end


fname = :TRSpectral
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs... )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataSpectral,solve_modelTRDiag,preprocessSpectral,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )

        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
    end 

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end


fname = :TRSpectral_abs
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs... )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataSpectral,solve_modelTRDiagAbs,preprocessSpectral,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)

        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

fname = :ARCLDLt
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataLDLt,solve_modelARCDiag,preprocessLDLt,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

fname = :ARCLDLt_abs
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataLDLt,solve_modelARCDiagAbs,preprocessLDLt,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

fname = :TRLDLt
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataLDLt,solve_modelTRDiag,preprocessLDLt,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

fname = :TRLDLt_abs
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataLDLt,solve_modelTRDiagAbs,preprocessLDLt,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end



fname = :ARCqKOp
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_operator,PDataK,solve_modelKARC,preprocessKARC,decreaseKARC,TparamsKARC())
        
        #ARCK = TrustRegion(10.0,params = TparamsKARC() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :ARCqKsparse
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_sparse,PDataK,solve_modelKARC,preprocessKARC,decreaseKARC,TparamsKARC())
        
        #ARCK = TrustRegion(10.0,params = TparamsKARC() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :ARCqKdense
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataK,solve_modelKARC,preprocessKARC,decreaseKARC,TparamsKARC())
        
        #ARCK = TrustRegion(10.0,params = TparamsKARC() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end



fname = :TRKOp
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_operator,PDataK,solve_modelKTR,preprocessKTR,decreaseKTR,TparamsKTR())
        
        #ARCK = TrustRegion(10.0,params = TparamsKARC() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :TRKsparse
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_sparse,PDataK,solve_modelKTR,preprocessKTR,decreaseKTR,TparamsKTR())
        
        #ARCK = TrustRegion(10.0,params = TparamsKARC() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :TRKdense
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataK,solve_modelKTR,preprocessKTR,decreaseKTR,TparamsKTR())
        
        #ARCK = TrustRegion(10.0,params = TparamsKARC() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end



fname = :ST_TROp
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_operator,PDataST,solve_modelST_TR,preprocessST,decreaseGen,TparamsST())
        
        #ARCK = TrustRegion(10.0,params = TparamsST() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :ST_TRsparse
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_sparse,PDataST,solve_modelST_TR,preprocessST,decreaseGen,TparamsST())
        
        #ARCK = TrustRegion(10.0,params = TparamsST() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :ST_TRdense
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataST,solve_modelST_TR,preprocessST,decreaseGen,TparamsST())
        
        #ARCK = TrustRegion(10.0,params = TparamsST() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end



fname = :ST_ARCOp
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_operator,PDataST,solve_modelST_ARC,preprocessST,decreaseGen,TparamsST())
        
        #ARCK = TrustRegion(10.0,params = TparamsST() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :ST_ARCsparse
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_sparse,PDataST,solve_modelST_ARC,preprocessST,decreaseGen,TparamsST())
        
        #ARCK = TrustRegion(10.0,params = TparamsST() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :ST_ARCdense
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...
                    )  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataST,solve_modelST_ARC,preprocessST,decreaseGen,TparamsST())
        
        #ARCK = TrustRegion(10.0,params = TparamsST() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
                                                                         
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end 
end

fname = :ARCMA97
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataMA97,solve_modelARCDiag,preprocessMA97,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

fname = :ARCMA97_abs
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataMA97,solve_modelARCDiagAbs,preprocessMA97,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
       
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

fname = :TRMA97
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataMA97,solve_modelTRDiag,preprocessMA97,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

fname = :TRMA97_abs
@eval begin
export $fname
push!(solvers,fname)
    function $fname(nlp :: AbstractNLPModel,
                    x0 :: Array{Float64,1};
                    kwargs...)  
        n = nlp.meta.nvar
        
        c = Combi(hessian_dense,PDataMA97,solve_modelTRDiagAbs,preprocessMA97,decreaseFact,Tparam())
        
        #ARCK = TrustRegion(10.0,params = Tparam() )
        ARCK = TrustRegion(10.0 )
        
        x, f, gNorm, gnorm2, iter, calls, optimal, status = TRARC(nlp, 
                                                                  x0,
                                                                  ARCK,
                                                                  c;
                                                                  kwargs...)
        
        return (x, f, gnorm2, iter, optimal, status == :UserLimit, status)
        
    end

    function $fname(nlp :: AbstractNLPModel; kwargs ...)
        x0 = copy(nlp.meta.x0)
        return  $fname(nlp, x0; kwargs... ) 
    end
end

deleteat!(solvers,1)
