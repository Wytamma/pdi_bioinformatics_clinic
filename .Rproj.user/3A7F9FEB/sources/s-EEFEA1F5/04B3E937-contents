monitauR::monitor(token = "bioinfo_clinic")

#< Load libraries
library(GISAIDR)
library(lubridate)

#< Log in using GISAID username and password
credentials <- login(
    username = "wytamma",
    password = Sys.getenv("GISAIDR_PASSWORD")
)

#< Searching for early Victorian entries
df <- query(
    credentials = credentials,
    location = 'Australia/Victoria',
    complete = T,
    to = '2020-03-26',
    low_coverage_excl = T,
    load_all = T
)
#< { sprintf("Found %s entries!", nrow(df)) }

#< Downsampling entries
sampled_df <- df[sample(nrow(df), 100, replace = FALSE), ]

#< Downloading 100 full sequences
full_df <- download(
    credentials = credentials,
    sampled_df$accession_id,
    get_sequence = T
)

#< Saving sequences to fasta file
export_fasta(full_df,  out_file_name = 'GISAID_sequences.fasta')
