#' @title Replace Text Inside a Word Document
#'
#' @description
#' Provides a method to replace text inside a docx document.
#' It returns a reference to the modified word document.
#' @param x \code{\link{docx}} object
#' @param oldTexts a character vector ; it contains the old texts to be replaced.
#' @param newTexts a character vector ; it contains the new texts.
#' @return a word document reference
#' @export
replaceText = function( x, oldTexts, newTexts ){
	if( length( oldTexts ) != length( newTexts ) ) stop("argument oldTexts and newTexts must have be character vectors of the same size.")
	if( !is.character( oldTexts ) ) stop("argument oldTexts must be a character vector.")
	if( !is.character( newTexts ) ) stop("argument newTexts must be a character vector.")

	if( !inherits(x, "docx")){
		stop("x must be a docx object.")
	}

	.jcall(x$obj, "V", "replaceText", oldTexts, newTexts)

	x
}