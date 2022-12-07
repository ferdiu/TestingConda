
__precompile__()

module TestingConda

using PyCall

export matplotlib, scipy_io, construct_w, lap_score, fisher_score

const matplotlib = PyNULL();
const scipy_io = PyNULL();
const construct_w = PyNULL();
const lap_score = PyNULL();
const fisher_score = PyNULL();


function __init__()
    PyCall.Conda.lib_dir(joinpath(PyCall.Conda.ROOTENV, "lib"))

    copy!(matplotlib, pyimport_conda("matplotlib", "matplotlib"))
    copy!(scipy_io, pyimport_conda("scipy.io", "scipy"))

    PyCall.Conda.pip("install", "git+https://github.com/jundongl/scikit-feature.git#egg=skfeature", PyCall.Conda.ROOTENV)

    copy!(construct_w, pyimport_conda("skfeature.utility.construct_W", "skfeature"))
    copy!(lap_score, pyimport_conda("skfeature.function.similarity_based.lap_score", "skfeature"))
    copy!(fisher_score, pyimport_conda("skfeature.function.similarity_based.fisher_score", "skfeature"))
end

end # module
