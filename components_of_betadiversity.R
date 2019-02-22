#################################
#
# WHY PARTITIONING BETADIVERSITY?
#
#################################

require(betapart)

# 2 higly nested populations
P <- c(1,1,1,1,1)
C <- c(1,1,0,0,0)
data <- rbind(P,C)
# betadiversity
beta.pair(data)
# beta sor = 0.43
# beta sim (turnover) = 0
# beta sne (nestedness) = 0.43

# the measured difference is only due to nestedness! We want to separate this from turnover, because we may misinterpret
# the results because turnover is so intuitive.




#################################
#
# ABUNDANCE BETA
#
#################################


# understanding betadiversity of abundance data


# 2 sites, j and k. They differ in their balanced and gradient beta diversities.
j <- c(2000, 300)
k <- c(95, 370)
# how can we get from j to k, while only using bal and gra steps?

# 1. 
# balanced (don't remove any individuals)
# --> redistribute all individuals from j such that they are distributed
# among species with the same ratio as in k.
# "making j more similar to k, but keep number of individuals"
jb <- sum(j) * k/sum(k)
# prove : 
jb/sum(jb)
k / sum(k)
# ratios are the same

# 2. 
# gradient : remove (fractions of) individuals, but don't change the ratio
jbg <- jb * (k / jb)
# prove : 
jbg
k
# the vectors are identical now


# 1. gewichtung zwischen spezies ändern
# 2. bruchteil der individuen nehmen



###########################
#
#  Recognising monoculture-like sites
#
###########################

# situation 1 : 
# 2 sites, each with same amount of species, highly dominated by one species
A <- c(40, 1, 2, 1)
B <- c(1, 2, 40, 1)

## presence-absence
Ap <- c(1, 1, 1, 1)
Bp <- c(1,1, 1, 1)
beta.pair(rbind(Ap, Bp))
## abundance
beta.pair.abund(rbind(A, B))

# This situation can only be distinguished by beta bal!



# add more code






