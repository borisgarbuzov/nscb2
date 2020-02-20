noise01230 = append(array(0, dim = 97), c(1, 2, 3), after = 46)

testUtil123NoiseHorizontal(
  tParCount = 11,
  tPar = 0.5,
  lag = 1,
  noise = noise01230,
  correctHorizontalGammaHat = 0.02
)
