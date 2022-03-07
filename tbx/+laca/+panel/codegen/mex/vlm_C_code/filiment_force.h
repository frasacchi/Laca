/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * filiment_force.h
 *
 * Code generation for function 'filiment_force'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "vlm_C_code_types.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void filiment_force(const emlrtStack *sp, const emxArray_real_T *rings,
                    const emxArray_real_T *V, emxArray_real_T *connectivity,
                    emxArray_real_T *b_gamma, real_T rho, emxArray_real_T *F);

/* End of code generation (filiment_force.h) */
