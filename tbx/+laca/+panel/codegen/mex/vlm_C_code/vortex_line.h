/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * vortex_line.h
 *
 * Code generation for function 'vortex_line'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void vortex_line(const emlrtStack *sp, const real_T p1[3], const real_T p2[3],
                 const real_T p_i[3], real_T b_gamma, real_T eta, real_T q[3]);

/* End of code generation (vortex_line.h) */
