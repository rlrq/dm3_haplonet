library(pegas)

## check session info, package versions
sessionInfo()

## read data
data <- read.dna("DM3 haplotype2.fasta", format="fasta")

## align (redundant, no gaps in output alignment)
dataAli <- clustal(data)
checkAlignment(dataAli)

## generate haplotype info
dataHaplo <- sort(haplotype(dataAli), what = "labels")

## generate haplotype network
dataNet <- haploNet(dataHaplo)

## plot
pdf(file="haploNet_DM3.pdf", width = 16, height = 30, pointsize = 8)
plot(dataNet, size = attr(dataNet, "freq"), fast = FALSE, threshold = 0, labels = FALSE)
dev.off()
