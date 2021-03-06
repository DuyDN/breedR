#' Covariance structure of a breedR component
#' 
#' This generic function returns the covariance or precision matrix of a breedR 
#' random effect or a group of effects.
#' 
#' For \code{effect_group}s, it returns the common structure of all the elements
#' in the group.
#' 
#' @param x A \code{breedr_effect}.
#'   
get_structure <- function(x) UseMethod('get_structure')

#' Parameters of a breedR component
#' 
#' @param x Some \code{breedR} component.
#'   
get_param <- function(x) UseMethod('get_param')

#' Type of a (group of) effect(s)
#' 
#' Generic function that returns whether an effect or a group of effects in a
#' breedR mixed model is \code{fixed} or \code{random}
#' @param x object to be \emph{translated} to progsf90
effect_type <- function(x) UseMethod('effect_type')

#' Size of a (group of) effect(s)
#' 
#' Returns 0 for a \code{fixed} effect, and the size of a \code{effect_group}
#' @param x element of the breedr_modelframe
effect_size <- function(x) UseMethod('effect_size')

#' Render a progsf90 effect
#' 
#' Translates breedR effects into progsf90 parameters and data.
#' 
#' This is an internal function. Not exported.
#' 
#' @param x object of class breedr_modelframe, effect_group or breedr_effect.
#' @return The number of levels and type for each 'virtual' effect; the progsf90
#'   model-name as appropriate; a file name and its content.
#' @family renderpf90
renderpf90 <- function(x) UseMethod('renderpf90')

#' Get the Pedigree from an object
#' 
#' Returns an object from the formal class \code{pedigree}.
#' @param x object to extract pedigree from
#' @param ... Arguments to be passed to methods.
#' @references \code{\link[pedigreemm]{pedigree-class}} from package
#'   \code{pedigreemm}
#' @export
get_pedigree <- function(x, ...) UseMethod('get_pedigree')

#' Extract the number of traits
#' @param x a metagene object.
#' @param ... Arguments to be passed to methods.
#' @family metagene
#' @export
get_ntraits <- function(x, ...) UseMethod('get_ntraits')


#' 'move' an arrangement in a given direction
#' @param x matrix or list of matrices
#' @param dir a \emph{direction} in ('N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW')
neighbours.at <- function(x, dir) UseMethod('neighbours.at')


#' Number of generations
#' @param x a metagene object.
#' @param ... Arguments to be passed to methods.
#' @family metagene
#' @export
ngenerations <- function(x, ...) UseMethod('ngenerations')

#' Number of individuals
#' @param x a metagene object.
#' @param ... Arguments to be passed to methods.
#' @family metagene
#' @export
nindividuals <- function(x, ...) UseMethod('nindividuals')

#' Simulate a spatial structure
#' 
#' Takes a metagene simulated dataset and distributes its individuals randomly 
#' into a more or less square spatial region. Furthermore, it takes part of the 
#' phenotypic noise and puts some spatial structure into it.
#' 
#' Founders are not put into place, as they don't have phenotypic values. 
#' Therefore, they are returned without coordinates nor spatial values.
#' 
#' The variance of the spatial field is given as a proportion of the variance of
#' the random noise that was added to the Breeding Values to produce the 
#' phenotypes. The phenotypes are afterwards recalculated to preserve the 
#' heritability.
#' 
#' The spatial unit is the distance between consecutive trees.
#' @param meta A metagene object
#' @param variance A number between 0 and 1. The variance of the spatial field 
#'   as a proportion of the non-inheritable phenotypic variance. See Details.
#' @param range A number between 0 and 1. The range of the spatial field, as a 
#'   proportion of the region size.
#' @param ... Arguments to be passed to methods.
#' @return Another metagene object with spatial structure given through an 
#'   additional column \code{sp_X} with the spatially structured component of 
#'   the phenotype, and a 'spatial' list element with coordinates and simulation
#'   information
#' @export
sim.spatial <- function(meta, variance, range, ...) UseMethod('sim.spatial')
