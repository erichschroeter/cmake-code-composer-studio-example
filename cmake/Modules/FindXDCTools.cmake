#[=======================================================================[.rst:
FindXDCTools
-------

Finds the XDCTools library.

Use this module by invoking :command:`find_package` with the form:

.. code-block:: cmake

  find_package(XDCTools
    [version] [EXACT]      # Minimum or EXACT version e.g. 1.67.0
    [REQUIRED]             # Fail with error if XDCTools is not found

Result Variables
^^^^^^^^^^^^^^^^

This will define the following variables:

``XDCTools_FOUND``
  True if the system has the XDCTools library.

``XDCTools_VERSION``
  The version of the XDCTools library which was found.

``XDCTools_VERSION_MAJOR``
  XDCTools major version number (``W`` in ``W.X.Y.Z``).

``XDCTools_VERSION_MINOR``
  XDCTools minor version number (``X`` in ``W.X.Y.Z``).

``XDCTools_VERSION_PATCH``
  XDCTools patch version number (``Y`` in ``W.X.Y.Z``).

``XDCTools_VERSION_TWEAK``
  XDCTools patch version number (``Z`` in ``W.X.Y.Z``).

``XDCTools_VERSION_COUNT``
  Amount of version components (4).

``XDCTools_INCLUDE_DIRS``
  Include directories needed to use XDCTools.

``XDCTools_XS``
  The ``xs`` program needed to use XDCTools.

Cache Variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``XDCTools_DIR``
  The directory containing ``xs.exe``.

#]=======================================================================]

include(FindPackageHandleStandardArgs)

if(NOT DEFINED XDCTools_DIR)
    set(XDCTools_DIR "C:/ti/xdctools_3_32_00_06_core")
endif()

find_program(XDCTools_XS
    NAMES xs
    PATHS "${XDCTools_DIR}"
    CMAKE_FIND_ROOT_PATH_BOTH)

find_path(XDCTools_INCLUDE_DIR
    NAMES "std.h"
    PATHS "${XDCTools_DIR}/packages"
    PATH_SUFFIXES "xdc"
    CMAKE_FIND_ROOT_PATH_BOTH)
# Get the parent directory.
get_filename_component(XDCTools_INCLUDE_DIR "${XDCTools_INCLUDE_DIR}" DIRECTORY)

# Parse version variables from path.
if(${XDCTools_DIR} MATCHES "_([0-9]+)_([0-9]+)_([0-9]+)_([0-9]+)_core$")
    set(XDCTools_VERSION_MAJOR "${CMAKE_MATCH_1}")
    set(XDCTools_VERSION_MINOR "${CMAKE_MATCH_2}")
    set(XDCTools_VERSION_PATCH "${CMAKE_MATCH_3}")
    set(XDCTools_VERSION_PATCH "${CMAKE_MATCH_4}")
    set(XDCTools_VERSION_COUNT "4")
    set(XDCTools_VERSION "${CMAKE_MATCH_1}.${CMAKE_MATCH_2}.${CMAKE_MATCH_3}.${CMAKE_MATCH_4}")
endif()

find_package_handle_standard_args(XDCTools
    REQUIRED_VARS XDCTools_XS XDCTools_DIR XDCTools_INCLUDE_DIR
    VERSION_VAR XDCTools_VERSION)

mark_as_advanced(XDCTools_XS XDCTools_DIR XDCTools_INCLUDE_DIR)
set(XDCTools_INCLUDE_DIRS ${XDCTools_INCLUDE_DIR})