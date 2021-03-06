// Copyright (c) 2018-present, Facebook, Inc.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

DEFINE-CHECKER FIND_CXX_COPY_CONSTRUCTOR = {

LET is_copy_constructor =
  is_node("CXXConstructExpr") AND is_cxx_copy_constructor();

SET report_when  =
  IN-NODE VarDecl WITH-TRANSITION InitExpr
    (is_copy_constructor HOLDS-EVENTUALLY )
  HOLDS-EVENTUALLY;

SET message = "Found Copy Constructor";

};
