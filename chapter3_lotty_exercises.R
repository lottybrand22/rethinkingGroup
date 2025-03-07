library(rethinking)

p_grid <- seq( from=0 , to=1 , length.out=1000 )
prior <- rep( 1 , 1000 )
likelihood <- dbinom( 6 , size=9 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e4 , replace=TRUE )


#3E1. How much posterior probability lies below p = 0:2?
sum( samples < 0.2 )
sum( samples < 0.2 ) / 1e4
#[1] 5e-04

#3E2. How much posterior probability lies above p = 0:8?
sum( samples > 0.8 ) / 1e4
#[1] 0.1117

#3E3. How much posterior probability lies between p = 0:2 and p = 0:8?
sum( samples > 0.2 & samples < 0.8 ) / 1e4
#[1] 0.8878

#3E4. 20% of the posterior probability lies below which value of p?
quantile( samples , 0.2 )
#20% 
#0.5195195

#3E5. 20% of the posterior probability lies above which value of p?
quantile( samples , 0.8 )
#80% 
#0.7567568

#3E6. Which values of p contain the narrowest interval equal to 66% of the posterior probability?
HPDI( samples , prob=0.66 )
#  |0.66     0.66| 
#0.5205205 0.7847848 

#3E7. Which values of p contain 66% of the posterior probability, assuming equal posterior probability
#both below and above the interval?

PI( samples , prob=0.66 )
#17%       83% 
#0.5005005 0.7687688 

p_grid <- seq( from=0 , to=1 , length.out=1000 )
prior <- rep( 1 , 1000 )
likelihood <- dbinom( 8 , size=15 , prob=p_grid )
posterior <- likelihood * prior
posterior <- posterior / sum(posterior)
set.seed(100)
samples <- sample( p_grid , prob=posterior , size=1e4 , replace=TRUE )

HPDI(samples, 0.9)

samples <- sample( p_grid , prob=posterior , size=1e4 , replace=TRUE )
w <- rbinom( 1e4 , size=15 , prob=samples )

sum( w==8 ) / 1e4
