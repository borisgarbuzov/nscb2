sample <- array(c(1, 1, 1, 1, 1, 1, 1, 1))
batchSize <- computeBatchSize(sampleSize = length(sample))

expectedSample <- array(c(1, 1, 1, 1, 1, 1, 1))
expectedLength <- length(sample) - batchSize + 1

testUtil123SquaredBatchBlockSums(sample = sample,
                                 batchSize = batchSize,
                                 expectedSample = expectedSample,
                                 expectedLength = expectedLength)
