/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * induced_velocity.h
 *
 * Code generation for function 'induced_velocity'
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
void induced_velocity(const emlrtStack *sp, const real_T point[3],
                      const emxArray_real_T *rings,
                      const emxArray_real_T *te_rings,
                      const emxArray_real_T *te_idx,
                      const emxArray_real_T *b_gamma, real_T V[3]);

/* End of code generation (induced_velocity.h) */
