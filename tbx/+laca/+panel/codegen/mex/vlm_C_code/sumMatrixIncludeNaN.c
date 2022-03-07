/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * sumMatrixIncludeNaN.c
 *
 * Code generation for function 'sumMatrixIncludeNaN'
 *
 */

/* Include files */
#include "sumMatrixIncludeNaN.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_types.h"

/* Function Definitions */
real_T sumColumnB(const emxArray_real_T *x, int32_T col)
{
  int32_T i0;
  i0 = (col - 1) * 3;
  return (x->data[i0] + x->data[i0 + 1]) + x->data[i0 + 2];
}

/* End of code generation (sumMatrixIncludeNaN.c) */
