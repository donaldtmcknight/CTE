#' Calculate Constant Temperature Equivalent (CTE)
#'
#' Calculate movements in a stream network for multiple individuals
#'
#' @param M (integer) Mean temperature for a given day in degrees centigrade
#' @param R (integer) Maximum deviation of temperatures from M for a given day in degrees centigrade (e.g., if the range of temperatures is 14‒16 and M = 20, then R = 6)
#' @param T0 (integer) Temperature in degrees centigrade below which no development will occur. Default = 0.
#' @param t (integer; 0 < t < 2pi) Starting seed for calculating the point along the curve above which half of development occurs. Any value > 0 and < 2pi will work. Default = pi.
#' @param max.it (numeric) Maximum number of times the function will try to find a solution for a given day. In rare cases, no stable solution exists, in which case it will attempt to find a solution max.it number of times before returning NA. Default = 10000
#' @return Numeric value of the CTE for a given day (in degrees centigrade)
#' @details
#' CTE takes input values for a given day and returns the CTE using the formulas in Georges (1989). It automatically selects the appropriate formula based on whether the minimum temperature (M-R) is less than T0. T0 may not be precisely known in all cases, but should be estimated based on knowledge of the species being studied. If you think your nest never dropped below T0 (i.e., there was not point at which development was not occurring) then set T0 lower than your minimum temperature. If M+R < T0 (i.e., all temps on a given day were less than T0, then T0 is returned as CTE). Because this function operates on data from a single day, in most cases you will want to run it within a looping function. See Vignette for details on the formulas and examples.
#'
#' @references
#' Georges, A. (1989).
#' *Female turtles from hot nests: is it duration of incubation or proportion of development at high temperatures that matters?*.
#' Oecologia, **81**, 323-328
#' @export
#'
#' @examples
#' CTE(M=20, R = 6, T0=10)

CTE <- function(M,R,T0=0,t = pi,max.it=10000){

  if(M+R < T0){t <- T0}else{

    if(M-R >= T0){
      loop.counter <- 1
      repeat{
        result <- (pi/2 - R/(M-T0)*sin(t))

        if(round(t, digits = 5) == round(result, digits= 5)){break}
        if(loop.counter == max.it){t <- NA
        break}
        loop.counter <- loop.counter + 1
        t <- result}
    }else{

      t0 <- acos(((T0-M)/R))

      ta <- 0
      tc <- pi
      tb <- 4*pi
      loop.counter <- 1
      repeat{
        if(is.nan(t0)==T){t <- NA
        break}
        res <- (t0/2)+((R/(2*(M-T0)))*sin(t0))-((R/(M-T0))*sin(tc))

        if(round(res,5) == round(tc,5)){break}
        if(res > tc){ta <- tc
        tc <- ((tb-tc)/2)+tc}else{
          tb <- tc
          tc <- ((tc-ta)/2)+ta}
        if(loop.counter == max.it){t <- NA
        break}
        loop.counter <- loop.counter + 1
        t <- res
      }
    }
  }
  cte <- R*cos(t)+M
  cte}
