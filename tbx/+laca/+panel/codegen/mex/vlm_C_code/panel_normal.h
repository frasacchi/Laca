/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * panel_normal.h
 *
 * Code generation for function 'panel_normal'
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
void panel_normal(const emlrtStack *sp, const emxArray_real_T *Panels,
                  emxArray_real_T *out);

/* End of code generation (panel_normal.h) */
