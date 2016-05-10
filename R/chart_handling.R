#' @title Update Chart Data Inside a Word Document
#'
#' @description
#' Provides a method to update chart data from a docx document.
#' It returns a reference to the modified word document.
#' @param x \code{\link{docx}} object
#' @param bookmark a character value ; id of the Word bookmark to scan.
#' @param newData a data.frame ; it contains the new chart data.
#' @param ncolxaxis a integer ; the number of leftmost columns from the data.frame which will generate the x axis labels
#' @return a word document reference
#' @export
chart_updateData = function( x, bookmark, newData, ncolxaxis ){
	if( !is.data.frame( newData ) ) stop("argument newData must be a data.frame.")
	if( ncol( newData ) <= 1 ) stop("argument newData must be a data.frame with 2 or more columns.")
	if( nrow( newData ) <= 1 ) stop("argument newData must be a data.frame with 2 or more rows.")
	
	dirname = tempfile( )
	dir.create( dirname )
	
	if( !is.integer( ncolxaxis ) ) stop("argument ncolxaxis must be a integer.")
	if( ncolxaxis <= 0 ) stop("argument ncolxaxis must be bigger than 0.")
	if( ncolxaxis >= ncol( newData ) ) stop("argument ncolxaxis must be smaller than the number of columns in the data.frame newData.")

	bookmark <- casefold( bookmark, upper = FALSE )

	library(xlsx)
	newDataOriginPath = paste0(dirname, '/', bookmark, '.xlsx')	
	write.xlsx2(newData, newDataOriginPath, sheetName="Plan1", row.names=FALSE)

	if( !inherits(x, "docx")){
		stop("x must be a docx object.")
	}

	if( missing( bookmark ) )
		stop("needs a bookmark.")
	else {
		if( length( bookmark ) != 1 || !is.character(bookmark))
			stop("bookmark must be an atomic character.")
		.jcall(x$obj, "V", "setChartData", bookmark, newDataOriginPath, nrow(newData), ncol(newData), as.integer(ncolxaxis))
	}
	
	x
}

#' @title Chart XML Extraction From a Word Document
#'
#' @description
#' Provides a method to get chart XML from a docx document.
#' It returns a \code{character} containing the chart XML associated with the bookmark found in the document.
#' @param x \code{\link{docx}} object
#' @param bookmark a character value ; id of the Word bookmark to scan.
#' @return a character ; Chart XML
#' @examples
#'
#' @export
chart_extractXML = function( x, bookmark ){
	if( !inherits(x, "docx")){
		stop("x must be a docx object.")
	}

	if( missing( bookmark ) )
		stop("needs a bookmark.")
	else {
		if( length( bookmark ) != 1 || !is.character(bookmark))
			stop("bookmark must be an atomic character.")
		out = .jcall(x$obj, "[S", "getChartXML", casefold( bookmark, upper = FALSE ))
	}
	
	iconv(out, "UTF-8", "CP1252")
}

#' @title Chart XML Replace From a Word Document
#'
#' @description
#' Provides a method to replace chart XML from a docx document.
#' It returns a \code{character} vector containing all
#' chunk of chart found in the document.
#' @param x \code{\link{docx}} object
#' @param bookmark a character value ; id of the Word bookmark to scan.
#' @param XML a character value ; it represents a chart.
#' @return a word document reference
#' @export
chart_replaceXML = function( x, bookmark, XML, newData, ncolxaxis ){
	if( !is.data.frame( newData ) ) stop("argument newData must be a data.frame.")
	if( ncol( newData ) <= 1 ) stop("argument newData must be a data.frame with 2 or more columns.")
	if( nrow( newData ) <= 1 ) stop("argument newData must be a data.frame with 2 or more rows.")
	
	dirname = tempfile( )
	dir.create( dirname )
	
	if( !is.integer( ncolxaxis ) ) stop("argument ncolxaxis must be a integer.")
	if( ncolxaxis <= 0 ) stop("argument ncolxaxis must be bigger than 0.")
	if( ncolxaxis >= ncol( newData ) ) stop("argument ncolxaxis must be smaller than the number of columns in the data.frame newData.")
	
	library(xlsx)
	newDataOriginPath = paste0(dirname, '/', sample(1:10000, 1), '.xlsx')	
	write.xlsx2(newData, newDataOriginPath, sheetName="Plan1", row.names=FALSE)
	
	if( !inherits(x, "docx")){
		stop("x must be a docx object.")
	}

	if( missing( bookmark ) )
		stop("needs a bookmark.")
	else if( missing( XML ) || is.na( XML ))
		stop("needs a XML content.")
	else {
		if( length( bookmark ) != 1 || !is.character(bookmark))
			stop("bookmark must be an atomic character.")
		.jcall(x$obj, "V", "setChartXML", casefold( bookmark, upper = FALSE ), XML, newDataOriginPath, nrow(newData), ncol(newData), as.integer(ncolxaxis) )
	}
	x
}

#' @title Chart XML Replace From a Word Document
#'
#' @description
#' Provides a method to replace chart XML from a docx document.
#' It returns a \code{character} vector containing all
#' chunk of chart found in the document.
#' @param x \code{\link{docx}} object
#' @param bookmark a character value ; id of the Word bookmark to scan.
#' @param XML a character value ; it represents a chart.
#' @return a word document reference
#' @export
addChart = function( x, XML, newData, ncolxaxis, width = 6L, height = 4L, par.properties = parProperties(text.align = "center", padding = 5), bookmark = "" ){
	if( !is.data.frame( newData ) ) stop("argument newData must be a data.frame.")
	if( ncol( newData ) <= 1 ) stop("argument newData must be a data.frame with 2 or more columns.")
	if( nrow( newData ) <= 1 ) stop("argument newData must be a data.frame with 2 or more rows.")
	
	dirname = tempfile( )
	dir.create( dirname )
	
	if( !is.integer( ncolxaxis ) ) stop("argument ncolxaxis must be a integer.")
	if( ncolxaxis <= 0 ) stop("argument ncolxaxis must be bigger than 0.")
	if( ncolxaxis >= ncol( newData ) ) stop("argument ncolxaxis must be smaller than the number of columns in the data.frame newData.")
	
	library(xlsx)
	newDataOriginPath = paste0(dirname, '/', sample(1:10000, 1), '.xlsx')	
	write.xlsx2(newData, newDataOriginPath, sheetName="Plan1", row.names=FALSE)

	if( !inherits(x, "docx")){
		stop("x must be a docx object.")
	}

	if( missing( XML ) || is.na( XML ))
		stop("needs a XML content.")
	else {
		if( length( bookmark ) != 1 || !is.character(bookmark))
			stop("bookmark must be an atomic character.")
		else {
		    if( bookmark == "" ){
				.jcall( x$obj, "V", "add", XML, newDataOriginPath, nrow(newData), ncol(newData), as.integer(ncolxaxis), width, height, .jParProperties(par.properties))
			} else {
				.jcall( x$obj, "V", "add", XML, newDataOriginPath, nrow(newData), ncol(newData), as.integer(ncolxaxis), width, height, .jParProperties(par.properties), bookmark )
			}
		}
	}
	x
}