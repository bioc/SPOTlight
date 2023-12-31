set.seed(321)
# x_path <- paste0(system.file(package = "SPOTlight"), "/extdata/image.png")
# x_path <- "../../inst/extdata/SPOTlight.png"
x_path <- paste0(system.file(package = "SPOTlight"), "/extdata/SPOTlight.png")

# plotImage() ----
test_that("plotImage path", {
    # image
    x <- x_path
    plt <- plotImage(x = x)
    expect_equal(class(plt)[1], "gg")
})


# plotImage() ----
test_that("plotImage array", {
    # image
    x <- png::readPNG(x_path)
    plt <- plotImage(x = x)
    expect_equal(class(plt)[1], "gg")
})
# Can't run this on Bioconductor since it doesn't accept github packages
# test_that("plotImage Seurat", {
#     # if (!"SeuratData" %in% installed.packages()) {
#     #       devtools::install_github("satijalab/seurat-data")
#       # }
#     # image
#     if (!"stxBrain.SeuratData" %in% suppressWarnings(SeuratData::InstalledData()$Dataset))
#         suppressWarnings(SeuratData::InstallData(ds = "stxBrain.SeuratData"))
# 
#     x <- suppressWarnings(SeuratData::LoadData(
#         ds = "stxBrain",
#         type = "anterior1"))
# 
#     plt <- plotImage(x = x)
#     expect_equal(class(plt)[1], "gg")
# })

test_that("plotImage SPE", {
    # image
    library(ExperimentHub)
    eh <- ExperimentHub() # initialize hub instance
    q <- query(eh, "TENxVisium") # retrieve 'TENxVisiumData' records
    id <- q$ah_id[1] # specify dataset ID to load
    x <- eh[[id]]

    plt <- plotImage(x = x)

    expect_equal(class(plt)[1], "gg")
})

