/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * generate_rings.h
 *
 * Code generation for function 'generate_rings'
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
void generate_rings(const emlrtStack *sp, const emxArray_real_T *panels,
                    const emxArray_boolean_T *isTE, emxArray_real_T *Rings,
                    emxArray_real_T *Normal, emxArray_real_T *Collocation,
                    emxArray_real_T *TERings, emxArray_real_T *TEidx);

/* End of code generation (generate_rings.h) */
