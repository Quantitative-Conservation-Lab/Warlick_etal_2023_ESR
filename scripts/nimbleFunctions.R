
#returns precision matrix weights; in SSL_wDPS_IPM.Rmd instead
# iar.Q <- function (n, p, return_nimble=TRUE){
#   if (n < 2 * p)
#     stop("n must be >= 2*p\n")
#   tmp1 <- out <- matrix(0, n, n)
#   tmp2 <- ((-1)^c(0:p)) * choose(p, c(0:p))
#   for (i in (p + 1):n) {
#     tmp1[, i] <- c(rep(0, i - p - 1), tmp2, rep(0, n - i))
#   }
#   for (i in n:(p + 1)) {
#     tmp4 <- tmp1[, c(1:n)[tmp1[i, ] != 0]]
#     tmp5 <- tmp1[i, tmp1[i, ] != 0]
#     tmp6 <- t(t(tmp4) * tmp5)
#     tmp6[i, ] <- 0
#     out[i, ] <- -rowSums(tmp6)
#   }
#   out[1:p, ] <- out[n:(n - p + 1), n:1]
#   out <- diag(apply(out, 1, sum)) - out
#   if(!return_nimble){
#     return(out)
#   } else{
#     A <- -out; diag(A) <- 0
#     num <- rowSums(out!=0)-1
#     adj <- unlist(apply(A, 1, function(v){which(v!=0)})) 
#     w <- unlist(apply(A, 1, function(v)v[which(v!=0)]))
#     r <- nrow(out)-sum(zapsmall(eigen(out)$values)!=0)
#     return(
#       list(L=length(adj), num=num, weights=w, adj=adj, c=r)
#     )
#   }
# }

#state transition - females
getPHI_f <- nimbleFunction(
  run = function(z=double(0), phiP=double(0), phi1=double(0), phi2=double(0), 
                 phi3=double(0), phi4=double(0),
                 phi5=double(0), phiB=double(0), phiNB=double(0),
                 psi3=double(0), psi4=double(0), psi5=double(0), psiB=double(0), psiNB=double(0)) {
    returnType(double(1))
    ans <- rep(0,12)
    if(z==1)   ans <- c(0,phiP,0,0,0,0,0,0,0,0,0,1-phiP) #pup
    if(z==2)   ans <- c(0,0,phi1,0,0,0,0,0,0,0,0,1-phi1)   #yearling   
    if(z==3)   ans <- c(0,0,0,phi2,0,0,0,0,0,0,0,1-phi2)  #2yr
    if(z==4)   ans <- c(0,0,0,0,phi3*(1-psi3),0,phi3*psi3,0,0,0,0,1-phi3)  #3yr to B/PB
    if(z==5)   ans <- c(0,0,0,0,0,phi4*(1-psi4),0,phi4*psi4,0,0,0,1-phi4)    #4yr to B/PB
    if(z==6)   ans <- c(0,0,0,0,0,0,0,0,phi5*psi5,0,phi5*(1-psi5),1-phi5)    #5yr to B/NB                
    if(z==7)   ans <- c(0,0,0,0,0,0,0,phi4*psiB,0,phi4*(1-psiB),0,1-phi4)  #4B to B/NB
    if(z==8)   ans <- c(0,0,0,0,0,0,0,0,phi5*psiB,0,phi5*(1-psiB),1-phi5)       #5B to B/NB
    if(z==9)   ans <- c(0,0,0,0,0,0,0,0,phiB*psiB,0,phiB*(1-psiB),1-phiB)       #6+B to B/NB
    if(z==10)  ans <- c(0,0,0,0,0,0,0,0,phiNB*psiNB,0,phiNB*(1-psiNB),1-phiNB)   #5NB to B/NB
    if(z==11)  ans <- c(0,0,0,0,0,0,0,0,phiNB*psiNB,0,phiNB*(1-psiNB),1-phiNB)      #6+NB to B/NB
    if(z==12)  ans <- c(0,0,0,0,0,0,0,0,0,0,0,1) #D
    
    return(ans)
  }
)

#observations - females
getP_f <- nimbleFunction(
  run = function(z=double(0), p1=double(0), p2=double(0), p3=double(0), p4=double(0), p5=double(0),
                 pB=double(0), pNB=double(0), delB=double(0)) {
    returnType(double(1))
    ans <- rep(0,11)
    if(z==1)   ans <- c(1,0,0,0,0,0,0,0,0,0,0) #pups seen as pups
    if(z==2)   ans <- c(0,p1,0,0,0,0,0,0,0,0,1-p1)   #1yr      
    if(z==3)   ans <- c(0,0,p2,0,0,0,0,0,0,0,1-p2)   #2yr
    if(z==4)   ans <- c(0,0,0,p3,0,0,0,0,0,0,1-p3)   #3yr
    if(z==5)   ans <- c(0,0,0,0,p4,0,0,0,0,0,1-p4)    #4yr seen as PB
    if(z==6)   ans <- c(0,0,0,0,0,0,p5,0,0,0,1-p5)    #5yr seen as PB          
    if(z==7)   ans <- c(0,0,0,0,pB*(1-delB),pB*delB,0,0,0,0,1-pB)    #4yr B seen as NB/B
    if(z==8)   ans <- c(0,0,0,0,0,0,pB*(1-delB),pB*delB,0,0,1-pB)    #5yr B seen as NB/B
    if(z==9)   ans <- c(0,0,0,0,0,0,0,0,pB*(1-delB),pB*delB,1-pB)    #6+ B seen as NB/B
    if(z==10)  ans <- c(0,0,0,0,0,0,pNB,0,0,0,1-pNB) #5+ NB seen as NB
    if(z==11)  ans <- c(0,0,0,0,0,0,0,0,pNB,0,1-pNB) #6+ NB seen as NB
    if(z==12)  ans <- c(0,0,0,0,0,0,0,0,0,0,1)
    
    return(ans)
  }
)

#state transition - males
getPHI_m <- nimbleFunction(
  run = function(z=double(0), phiPM=double(0), phi1M=double(0), phi2M=double(0), phi3M=double(0), phi4M=double(0),
                 phi5M=double(0), phiBM=double(0)) {
    returnType(double(1))
    ans <- rep(0,8)
    if(z==1)   ans <- c(0,phiPM,0,0,0,0,0,1-phiPM) #pup
    if(z==2)   ans <- c(0,0,phi1M,0,0,0,0,1-phi1M) #yearling
    if(z==3)   ans <- c(0,0,0,phi2M,0,0,0,1-phi2M) #2yr
    if(z==4)   ans <- c(0,0,0,0,phi3M,0,0,1-phi3M) #3yr 
    if(z==5)   ans <- c(0,0,0,0,0,phi4M,0,1-phi4M) #4yr 
    if(z==6)   ans <- c(0,0,0,0,0,0,phi5M,1-phi5M) #5yr              
    if(z==7)   ans <- c(0,0,0,0,0,0,phiBM,1-phiBM) #B 
    if(z==8)   ans <- c(0,0,0,0,0,0,0,1) #D
    
    return(ans)
  }
)

#observations - males
getP_m <- nimbleFunction(
  run = function(z=double(0), p1M=double(0), p2M=double(0), p3M=double(0), p4M=double(0), p5M=double(0),
                 pBM=double(0)) {
    returnType(double(1))
    ans <- rep(0,8)
    if(z==1)   ans <- c(1,0,0,0,0,0,0,0)       #pup
    if(z==2)   ans <- c(0,p1M,0,0,0,0,0,1-p1M) #yearling    
    if(z==3)   ans <- c(0,0,p2M,0,0,0,0,1-p2M) #2yr
    if(z==4)   ans <- c(0,0,0,p3M,0,0,0,1-p3M) #3
    if(z==5)   ans <- c(0,0,0,0,p4M,0,0,1-p4M) #4 
    if(z==6)   ans <- c(0,0,0,0,0,p5M,0,1-p5M) #5               
    if(z==7)   ans <- c(0,0,0,0,0,0,pBM,1-pBM) #B
    if(z==8)   ans <- c(0,0,0,0,0,0,0,1)   #D
    return(ans)
  }
)