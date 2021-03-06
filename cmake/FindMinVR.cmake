## Use this to find the MinVR package.

####################### LOOKING FOR MinVR
##
## You can set the MinVR location with
## -DMINVR_INSTALL_DIR=/my/location/of/MinVR/install
## Remember, you're looking for the install location, not the repo
## location.  The default install is at MINVR_REPO/build/install.
##
### Look for MinVR
if(MINVR_INSTALL_DIR)
  message("-- Looking for MinVR in: " ${MINVR_INSTALL_DIR})
else(MINVR_INSTALL_DIR)
  message("MinVR install location not specified.  But we'll still look for it.")
  message("Use  -DMINVR_INSTALL_DIR=/my/location/of/MinVR/install to specify it.")
endif(MINVR_INSTALL_DIR)
  
find_path(MINVR_INCLUDE_DIR
  NAMES api/MinVR.h
	HINTS
  ${MINVR_INSTALL_DIR}/include
  /usr/local/include
  ENV CPATH)

find_library(MINVR_LIBRARY
  NAMES MinVR
	HINTS
  ${MINVR_INSTALL_DIR}/lib
  /usr/local/lib
  ENV LD_LIBRARY_PATH)

# Handle the QUIETLY and REQUIRED arguments and set MINVR_FOUND to
# TRUE if all listed variables are TRUE.
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
  MINVR
  DEFAULT_MSG 
  MINVR_LIBRARY 
  MINVR_INCLUDE_DIR)

# Copy the results to the output variables.
IF(MINVR_FOUND)
	SET(MINVR_LIBRARIES ${MINVR_LIBRARY})
	SET(MINVR_INCLUDE_DIRS ${MINVR_INCLUDE_DIR})
ELSE(MINVR_FOUND)
	SET(MINVR_LIBRARIES)
	SET(MINVR_INCLUDE_DIRS)
ENDIF(MINVR_FOUND)

MARK_AS_ADVANCED(MINVR_INCLUDE_DIRS MINVR_LIBRARIES)

