/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * generate_AIC.h
 *
 * Code generation for function 'generate_AIC'
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
void generate_AIC(const emlrtStack *sp, const emxArray_real_T *rings,
                  const emxArray_real_T *collocation,
                  const emxArray_real_T *normal,
                  const emxArray_real_T *te_rings,
                  const emxArray_real_T *te_idx, emxArray_real_T *AIC);

/* End of code generation (generate_AIC.h) */
