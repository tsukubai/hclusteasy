#' Plot the Principal Component Analysis
#'
#' @description Apply PCA (Principal Component Analysis) to the data and plot a scatterplot of
#'  the first two principal components.
#'
#' @param data Dataset in `data.frame` format.
#'
#' @param groups This parameter allows coloring of observations according
#'  to their group and drawing ellipses around each group with a confidence
#'  level of 0.98. The default is 'none'.
#'
#' @return A `ggplot`.
#'
#' @export
#' @examples
#'
#' # Load the packages
#' library(hclusteasy)
#'
#'
#' # Read iris dataset from packege
#' data("iris")
#'
#' # Select column "Species" (groups) from the iris dataset
#' species <- iris[, 5]
#'
#' # Remove column "Species" from the iris dataset
#' iris <- iris[, -5]
#'
#'
#' # Apply pca and ploting the two firsts components in pca, without groups
#' pca(iris)
#'
#' # Apply pca and ploting the first two components in pca, with groups
#' pca(iris, groups = species)
#'
#' @importFrom stats prcomp
#' @importFrom factoextra fviz_pca_ind
pca <- function(data, groups = "none") {
  # Principal component analysis (PCA)
  pca <- prcomp(data, scale. = FALSE)

  # Checks if exist groups for color the data samples and generate ellipses
  if (!("none" %in% groups)) {
    # Pca plot with color samples and ellipse by groups, ellipse level = 0.98
    p <- fviz_pca_ind(pca,
      habillage = groups, addEllipses = TRUE,
      ellipse.level = 0.98
    )
  } else {
    # Pca plot without groups
    p <- fviz_pca_ind(pca)
  }

  # Plot pca
  return(p)
}
