
noise01230 = append(array(0, dim = 197), c(1, 2, 3), after = 46)
noise01230 = append(array(0, dim = 197), c(3, 2, 1), after = 46)
noise01230 = append(array(0, dim = 197), c(1, 3, 2), after = 46)
noise01230 = append(array(0, dim = 197), c(1, -1, 1), after = 46)
noise01230 = append(array(0, dim = 197), c(1, -1, 1, -1), after = 46)
noise01230 = append(array(0, dim = 197), c(1, 1, -1, -1, 1), after = 46)

noise01230 = append(array(0, dim = 295), c(1, 1, -1, -1, 1), after = 147) # expect 0 for all t of horizontal
noise01230 = append(array(0, dim = 97), c(1, 2, 3), after = 46) # expect 0.02 at t=0.5

testUtiltest01230trueGammaAndGammaHatGraphSingleN(
  tParCount = 11,
  tPar = 0.5,
  lag = 1,
  noise = noise01230,
  correctHorizontalGammaHat = 0.02
)
