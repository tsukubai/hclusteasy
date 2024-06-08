#' Generate and select groups with hierarchical clustering
#'
#' @description Perform hierarchical clustering to generate group
#'  based on sample dissimilarity by euclidean method.
#'
#' @param data Dataset in `data.frame` format.
#'
#' @param method Method of agglomeration to be used: "ward.D", "ward.D2",
#'  "single", "complete", "average" (UPGMA), "mcquitty" (WPGMA),
#'  "median" (WPGMC), or "centroid" (UPGMC). Default is "complete".
#'
#' @param num.groups Number of groups to cutree. Default is 3.
#'
#' @return a vector of integers, where each element represents the group
#'  indicated for each observation in the original dataset.
#'
#' @export
#' @examples
#'
#' # Load the packages
#' library(hclusteasy)
#'
#'
#' # Read iris dataset from packege
#' data("iris_uci")
#'
#' # Remove column "Species" from the iris dataset
#' iris <- iris_uci[, -5]
#'
#'
#' # Apply hierarchical cluster analysis and selecting groups.
#' g <- hca(iris)
#'
#' @importFrom stats dist
#' @importFrom stats hclust
#' @importFrom stats cutree
hca <- function(data, method = "complete", num.groups = 3) {
  # Matriz dissimilarity
  d <- dist(x = data, method = "euclidean")

  # Hierarchical clustering
  hc <- hclust(d = d, method = method)

  # K groups
  g <- cutree(hc, k = num.groups)

  return(g)
}
