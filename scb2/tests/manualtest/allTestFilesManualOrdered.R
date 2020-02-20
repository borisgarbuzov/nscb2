# prerequisities ----

# loading the libs in
library(devtools)
library(testthat)
library(plyr)

# scb2 package is to be loaded too
devtools::load_all()

# saving getwd() to a variable
# (we have to restore it back
# as the test routine is completed)
saved.getwd <- getwd()

# entering inside of "scb2/scb2/tests/testthat/" dir
setwd("tests/testthat/")

# forming a list of test files; ----
# that is where the run order of the test files is defined!
# you can shuffle those files up or down
list_of_files <- list(
  "tests_prod2_001_createCMatrix.R",
  "tests_prod2_002_createDMatrix.R",
  "tests_prod2_003_createOriginalCauchyDist.R",
  "tests_prod2_004_createOriginalMA1.R",
  "tests_prod2_004a_createOriginalMAInfConstCoef.R",
  "tests_prod2_005_createOriginalMA1Replicated.R",
  "tests_prod2_006_createGamma.R",
  "tests_prod2_007_createRho.R",
  "tests_prod2_008_createCenteredBernNoise.R",
  "tests_prod2_009_createOriginalBernDens.R",
  "tests_prod2_010_createOriginalXX.R",
  "tests_prod2_011_createProductCol.R",
  "tests_prod2_013_createLRVProductColl.R",
  "tests_prod2_014_cutOB.R",
  "tests_prod2_015_cutNB.R",
  "tests_prod2_016_estimateLRVbyQuadraticForm.R",
  "tests_prod2_017_computeQuadraticFormMatrixFromNB.R",
  "tests_prod2_018_ComputeQuadraticFormValue.R",
  "tests_prod2_019_computeQuadraticFormMatrixFromOB.R",
  "tests_prod2_021_createBetaArray.R",
  "tests_prod2_022_createBetaArrayReplicated.R",
  "tests_prod2_023_ComputeBetaLRVArrayPsi0.R",
  "tests_prod2_024_createOriginalXminusX.R",
  "tests_prod2_025_computeSqareRootBatchSizeUpperBound.R",
  "tests_prod2_026_upperBoundLRVHatNorm.R",
  "tests_prod2_027_computeUpperBoundSumNorm.R",
  "tests_prod2_028_createLambdaArrayForOBiid.R",
  "tests_prod2_031_createCHatMatrix.R",
  "tests_prod2_032_createDHatMatrix.R",
  "tests_prod2_041_createLRVof2dArray.R",
  "tests_prod2_042_createLRVof3dArray.R",
  "tests_prod2_043_computeLRVofOB2dArray.R",
  "tests_prod2_044_EstimateLRVWu2009ForCenteredSample.R",
  "tests_prod2_044a_estimateWuForCenteredMAInfConstCoef.R",
  "tests_prod2_045_EstimateLRVWu2009ForNonCenteredSample.R",
  "tests_prod2_045a_estimateWuForNonCenteredMAInfConstCoef.R",
  "tests_prod2_046_DrawWuForCentWithMA.R",
  "tests_prod2_051_createDiffCMatrixVsCHatMatrix.R",
  "tests_prod2_052_createDiffDMatrixVsDHatMatrix.R",
  "tests_prod2_061_drawCVsCHat.R",
  "tests_prod2_062_drawDVsDHat.R",
  "tests_prod2_063_drawOriginalLrvHat.R",
  "tests_prod2_064_drawVectorLrvVsLrvHat.R",
  "tests_prod2_065_drawVectorLrvVsLrvHatForSize.R",
  "tests_prod2_066_drawLrvHatVsTSAVsBasePeriodogram.R",
  "tests_prod2_067_OBNBSizeCount.R",
  "tests_prod2_068_FixSampleChangeProp.R",
  "tests_prod2_069_ConstantProporsion.R",
  "tests_prod2_070_LRVCompareNBMatrixToCutter.R",
  "tests_prod2_071_saveProductCol.R",
  "tests_prod2_072_saveJPG.R",
  "tests_prod2_073_exportOriginal.R",
  "tests_prod2_074_LRVCompareOBMatrixToCutter.R",
  "tests_prod2_075_CompareLrvMatrixToCutterInType.R",
  "tests_prod2_076_testUtilOBNBExpansion.R",
  "tests_prod2_077_testUtilRenewalVSExpansion.R",
  "tests_prod2_078_SavePlotWu2009EstimateLRV.R",
  "tests_prod2_079_convertToSymMatrix.R",
  "tests_prod2_081_benchmarkCreateOriginalMA1.R",
  "tests_prod2_082_benchmarkCreateOriginalMA1Replicated.R",
  "tests_prod2_083_BenchmarkCreateProductCol.R",
  "tests_prod2_084_BenchmarkCreateCMatrix.R",
  "tests_prod2_085_BenchmarkCreateDMatrix.R",
  "tests_prod2_086_BenchmarkCreateBetaArray.R",
  "tests_prod2_087_BenchmarkCreateBetaArrayReplicated.R",
  "tests_prod2_088_BenchmarkCreateProductColReplicated.R",
  "tests_prod2_089_BenchmarkCreateCHatMatrix.R",
  "tests_prod2_090_BenchmarkCreateDHatMatrix.R",
  "tests_prod2_091_BenchmarkCutNB.R",
  "tests_prod2_092_BenchmarkCutOB.R",
  "tests_prod2_093_BenchmarkComputeLRVofOB2dArray.R",
  "tests_prod2_094_BenchmarkEstimateLRVbyQuadraticForm.R",
  "tests_prod2_095_BenchmarkEstimateWuForNonCenterdSample.R",
  "tests_prod2_096_BenchmarkEstimateWuForCenterdSample.R",
  "tests_prod2_099_createDevStats.R",
  "tests_prod2_100_drawMatrix.R",
  "tests_prod2_101_wuForCenteredWithXminusX.R",
  "tests_prod2_102_wuForCenteredWithXX.R",
  "tests_prod2_103_WuForCentWithXXExpansion.R",
  "tests_prod2_104_wuForCentWithXminusXExpansion.R",
  "tests_prod2_105_wuForNonCentWithXX.R",
  "tests_prod2_106_wuForNonCentWithXminusX.R",
  "tests_prod2_107_wuForNonCentWithXXExpansion.R",
  "tests_prod2_108_wuForNonCentWithXminusXExpansion.R",
  "tests_scb_001_createTParArray.R",
  "tests_scb_002_createTVMA1CoefArray.R",
  "tests_scb_003_createNoise.R",
  "tests_scb_004_createB.R",
  "tests_scb_005_createSample.R",
  "tests_scb_006_errorIfNotInputCompatible.R",
  "tests_scb_011_normalDifferenceKernel.R",
  "tests_scb_021_computeTermCount.R",
  "tests_scb_022_computeLagCount.R",
  "tests_scb_023_isLagCompatibleWithSampleSize.R",
  "tests_scb_024_saveBandwith.R",
  "tests_scb_025_isAlphaCompatibleWithSampleSiz.R",
  "tests_scb_026_computeMaxLagForSampleSize.R",
  "tests_scb_027_computeMinSampleSize.R",
  "tests_scb_028_computeMinSampleSizeForAlpha.R",
  "tests_scb_029_computeMinSampleSizeForBandwidth.R",
  "tests_scb_031_computeCovHat.R",
  "tests_scb_032_computeCorHat.R",
  "tests_scb_033_computeAllCorHats.R",
  "tests_scb_034_computeCor.R",
  "tests_scb_041_computeBetaLRVHat.R",
  "tests_scb_042_computeMEbyCovHat.R",
  "tests_scb_051_createBand.R",
  "tests_scb_052_createBandsBrick.R",
  "tests_scb_061_computeIsCovered.R",
  "tests_scb_062_computeIsCoveredArray.R",
  "tests_scb_063_computeNonCoverageFreq.R",
  "tests_scb_064_computeNonCoverageFreqArray.R",
  "tests_scb_065_createNonCoverageFreqDoubleArray.R",
  "tests_scb_071_saveBand.R",
  "tests_scb_072_saveNonCoverageFreqArray.R",
  "tests_scb_073_saveDoubleAplhaHatArray.R",
  "tests_scb_074_saveMeForAlpha.R",
  "tests_scb_075_saveMeArray3D.R",
  "tests_scb_076_saveMeArray3DForBandwith.R",
  "tests_scb_077_saveMeArray3DForSampleSize.R",
  "tests_scb_078_saveAlphaHatOfSampleSize.R",
  "tests_scb_079_saveBetaLRV.R",
  "tests_scb_080_saveCorAndCorHat.R",
  "tests_scb_081_saveMeForSampleSizeFunction.R",
  "tests_scb_082_saveMeForBandwithFunction.R",
  "tests_scb_083_testUtilSampleSizeBenchmarkFunction.R",
  "tests_scb_084_testUtilReplicationCountBenchmark.R",
  "tests_scb_085_testUtilSupeReplicationCountBenchmark.R",
  "tests_scb_086_testUtilTparCountBenchmark.R",
  "tests_scb2_104_nwLocalLRVBandwidth.R",
  "tests_scb2_105_nwDenominatorBandwidthChange.R",
  "tests_scb2_106_nwDenominatorMorePointsSameRange.R",
  "tests_scb2_107_nwDenominatorMorePointsWiderRange.R",
  "tests_scb2_108_nwDenominatorSmallerRange.R",
  "tests_scb2_109_nwDenominatorUnevenPointDensity.R",
  "tests_scb2_110_nwWeight.R",
  "tests_scb2_90_ThetaGraphics3d.R",
  "tests_scb2_91_ThetaGraphics2dFixedBatchSize.R",
  "tests_scb2_92_ThetaGraphics2dFixedIndex.R",
  "tests_scb2_93_ThetaGraphics2dCurvilinear.R",
  "tests_scb2_94_LambdaGraphics3d.R",
  "tests_scb2_95_LambdaGraphics2dFixedBatchSize.R",
  "tests_scb2_96_LambdaGraphics2dFixedIndex.R",
  "tests_scb2_97_LambdaGraphics2dCurvilinear.R",
  "tests_scb2_98_testUtilsumSqBlockSumsVarUpperBoundGraphics3d.R",
  "tests_scb2_99_SumSqBlockSumsVarUpperBoundGraphics2dCurvilinear.R",
  "tests_91_ThetaGraphics2dFixedBatchSize.R",
  "tests_prod2_012_createProductColReplicated.r",
  "tests_scb2_100_testUtilObmLRVHatVarUpperBoundGraphics3d.R",
  "tests_scb2_101_ObmLRVHatVarUpperBoundGraphics2dCurvilinear.R",
  "tests_scb2_102_localLRV.R",
  "tests_scb2_103_pcLocalLRVBandwidth.R",
  "tests_scb2_111_thetaTypeAxis.R",
  "tests_scb2_112_thetaTypeScaterplot.R",
  "tests_scb2_113_thetaTypeDivision.R",
  "tests_scb2_114_thetaTypeDivPower.R",
  "tests_scb2_115_theta.R",
  "tests_scb2_116_lambda.R",
  "tests_scb2_117_capitalTheta.R",
  "tests_scb2_117_capitalThetaTypeAxis.R",
  "tests_scb2_118_capitalThetaTypeScaterplot.R",
  "tests_scb2_119_capitalThetaTypeDivision.R",
  "tests_scb2_120_capitalThetaTypeDivPower.R",
  "tests_scb2_121_upperBound.R",
  "tests_scb2_122_upperBoundAxis.R",
  "tests_scb2_123_upperBoundScaterplot.R",
  "tests_scb2_124_upperBoundDivision.R",
  "tests_scb2_125_upperBoundDivPower.R",
  "tests_scb2_126_An.R",
  "tests_scb2_127_Bn.R",
  "tests_scb2_128_Dn.R",
  "tests_scb2_129_AnDivBn.R",
  "tests_scb2_130_ThetaVsCapitalThetaType.R",
  "tests_scb2_131_BetaNonRadomOriginal1.R",
  "tests_scb2_132_BetaNonRadomOriginalI.R",
  "tests_scb2_133_BetaSumOfNAEntries.R",
  "tests_scb2_134_BetaLRVAndBetaLRVHat.R",
  "tests_scb2_135_BetaLRVAndBetaLRVHatGrowSize.R",
  "tests_scb2_136_BenchmarkBetaLRVAndBetaLRVHatGrowSize.R",
  "tests_scb2_137_BenchmarkBetaLRVAndBetaLRVHat.R",
  "tests_scb2_138_BetaLRVAndBetaLRVHatGrowSizeExpansion.R",
  "tests_scb2_139_BetaHatNonRadomOriginal1.R",
  "tests_scb2_140_BetaHatNonRadomOriginalI.R",
  "tests_scb2_141_BetaHatSumOfNAEntries.R",
  "tests_scb2_142_BetaHatLRVHatAndBetaLRVHat.R",
  "tests_scb2_143_ProductSampleAndGammaHat.R",
  "tests_scb2_144_BetaHatAndBeta.R",
  # scenario 3 tests
  "tests_scb2_145_createListOfSamples.R",
  "tests_scb2_146_computeKernelLrvHat.R",
  "tests_scb2_147_computeKenrelLrvHatForSingleTPar.R",
  "tests_scb2_148_computeKenrelArray.R",
  "tests_scb2_149_sampleSplit.R",
  "tests_scb2_150_createNewTParArrayIndex.R",
  "tests_scb2_151_createLrvPlotScenario3SingleN.R",
  "tests_scb2_152_createLrvPlotScenario3SingleT.R",
  "tests_scb2_153_scenario3SingleT.R",
  "tests_scb2_154_scenario3SingleN.R",
  "tests_scb2_155_scenario3GraphForDifferentM.R",
  "tests_scb2_156_scenario3GraphForDifferentB.R",
  "tests_scb2_157_computeBatchSize.R",
  "tests_scb2_158_computeTrueLrv.R",
  "tests_scb2_159_computeTrueLrvMA1.R",
  "tests_scb2_160_computeTrueLrvScaledNoise.R",
  "tests_scb2_161_createGammaMA1.R",
  "tests_scb2_162_createGammaScaledNoise.R",
  "tests_scb2_163_createRhoMA1.R",
  "tests_scb2_164_createRhoScaledNoise.R",
  "tests_scb2_165_scenario3BatchSums.R",
  "tests_scb2_166_scenario3BetaMatrixSingleN.R",
  "tests_scb2_167_computeB.R",
  "tests_scb2_168_getDegree.R",
  "tests_scb2_169_getDegreeForBatchSize.R",
  "tests_scb2_170_computeBetaMatrix.R",
  "tests_scb2_171_scenario3BetaMatrixSingleT.R",
  "tests_scb2_172_computeBetaColumnScaledNoise.R",
  # end of scenario 3 tests
  # start of scenario 4 tests
  "tests_scb2_173_computeBForGamma.R",
  "tests_scb2_174_computeBOBM.R",
  "tests_scb2_175_computeBetaMatrixColumnHat.R",
  "tests_scb2_176_computeRhoHat.R",
  "tests_scb2_177_computeCovHatWithSeparateB.R",
  "tests_scb2_178_computeCorHatWithCorB.R",
  "tests_scb2_179_computeCovHatWithCovB.R",
  "tests_scb2_180_scenario4SingleN.R",
  "tests_scb2_181_scenario4SingleT.R",
  "tests_scb2_182_computeGammaHat.R",
  "tests_scb2_183_createNoisePlot.R",
  "tests_scb2_184_createHorizontalPlot.R",
  "tests_scb2_185_createDiagonalPlot.R",
  "tests_scb2_186_createNoiseScatterPlot.R",
  "tests_scb2_187_createHorizontalScatterPlot.R",
  "tests_scb2_188_createDiagonalScatterPlot.R",
  "tests_scb2_189_graphOfGammaHatAndVar.R",
  "tests_scb2_190_graphOfRhoHat.R",
  "tests_scb2_191_trueGammaAndGammaHatGraphSingleN.R",
  "tests_scb2_192_timesTableTest.R",
  "tests_scb2_193_manualDiagonalSample.R",
  "tests_scb2_194_betaColumnGraph.R",
  "tests_scb2_195_betaColumnGraphSingleN.R",
  "tests_scb2_196_computeBetaCell.R",
  "tests_scb2_197_computeBeta2d.R",
  "tests_scb2_198_computeSquaredBatchSums2d.R"
  # end of scenario 4 tests
)

# curTime <- Sys.time()
# curTime <- gsub(pattern = ":", replacement = "-", x = curTime)
# curTime <- gsub(pattern = " ", replacement = "_", x = curTime)
# fileName <- paste0("testManualLog_", curTime, ".txt")
# fileName <- file.path(paste0("../manualtest/", fileName))

# the test routine ----
# feeding that to testthat::test_file() via lapply()
# lapply(list_of_files, test_file)

# Feeding the files one-by-one to testthat::test_file() -----------------
lengthFilesList <- length(list_of_files)
# for (i in seq_len(lengthFilesList)) {
#   zz <- file(fileName, open="at")
#   sink(zz, append = T, type = c("output", "message"))
#   result <- paste0(i, "/", lengthFilesList,
#                    " tests completed (",
#                    round(i * 100 / lengthFilesList, 1), "%)."
#                    )
#   cat("\n", result, "\n")
#
#   if (i == lengthFilesList) {
#     cat("\n CONGRATS! All the texts have been completed!")
#   }
#
#   closeAllConnections()
# }

# Trying to keep some coal from burning -----------------
curTime <- Sys.time()
curTime <- gsub(pattern = ":", replacement = "-", x = curTime)
curTime <- gsub(pattern = " ", replacement = "_", x = curTime)
fileName <- paste0("testManualLogCreatedWithPlyrLply_", curTime, ".txt")

if (! dir.exists("../../../output")) {
  dir.create("../../../output")
}

if (! dir.exists("../../../output/log")) {
  dir.create("../../../output/log")
}

if (! dir.exists("../../../output/data_export")) {
  dir.create("../../../output/data_export")
}

if (! dir.exists("../../../output/images")) {
  dir.create("../../../output/images")
}

fileName <- file.path(paste0("../../../output/log/", fileName))

library(plyr)
plyr::l_ply(list_of_files, function(i) {
  zz <- file(fileName, open="at")
  sink(zz)
  testthat::test_file(i, reporter = "rstudio")
  elementIndex <- which(list_of_files == i)
  result <- paste0(elementIndex, "/", lengthFilesList, " tests completed (",
                   round(elementIndex * 100 / lengthFilesList, 1), "%)."
  )
  cat(i, " are processed. \n")
  cat(result, "\n")
  closeAllConnections()
  cat(i, "\n")
  return(result)
  },
  .print = T,
  # .progress = "text"
  .progress = "win"
  #.parallel = T,
)

closeAllConnections()

file.copy(from = "plots/",
          to = "../../../output/images",
          recursive = T)

file.copy(from = "output/",
          to = "../../../output/images",
          recursive = T)

file.copy(from = "export/",
          to = "../../../output/data_export",
          recursive = T)

unlink("plots", recursive = T)
unlink("export", recursive = T)
unlink("output", recursive = T)

# restoring the old work dir, ------------
# that is,  the root dir of the package -- "scb2/scb2"
setwd(saved.getwd)

# l_ply(list(1:1000), function(i){rnorm(i)}, .progress="text")


