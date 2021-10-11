monitauR::monitor(token = "bioinfo_clinic")

#< Aligning using kalign
system("kalign -i GISAID_sequences.fasta -f fasta -o aligned.fasta")
