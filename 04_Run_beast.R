monitauR::monitor(token = "bioinfo_clinic")

#< Creating dynamic XML file
system("dynamic-beast data/gisaid_BD.xml > dynamic_gisaid.xml")

#< Setting up dynamic params
CHAIN_LENGTH <- 1000000  # number of step in MCMC chain
NUMBER_OF_SAMPLES <- 1000  # number of samples to collect
SAMPLE_FREQUENCY <- CHAIN_LENGTH / NUMBER_OF_SAMPLES
dynamic_params <-
  sprintf(
    "mcmc.chainLength=%s,treelog.t:aligned.logEvery=%s,tracelog.logEvery=%s",
    format(CHAIN_LENGTH, scientific = FALSE),
    SAMPLE_FREQUENCY,
    SAMPLE_FREQUENCY
  )

#< Starting beast
system(sprintf(
  'source ~/.zshrc && beast -beagle_CPU -overwrite -D "%s" dynamic_gisaid.xml',
  dynamic_params
))
