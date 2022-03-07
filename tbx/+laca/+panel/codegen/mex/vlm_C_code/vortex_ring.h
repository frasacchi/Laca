/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * vortex_ring.h
 *
 * Code generation for function 'vortex_ring'
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
void b_vortex_ring(const emlrtStack *sp, const real_T coords[12],
                   const real_T p[3], real_T b_gamma, real_T q[3]);

void vortex_ring(const emlrtStack *sp, const emxArray_real_T *coords,
                 const real_T p[3], real_T b_gamma, real_T q[3]);

/* End of code generation (vortex_ring.h) */
