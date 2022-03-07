/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * vlm_C_code_initialize.c
 *
 * Code generation for function 'vlm_C_code_initialize'
 *
 */

/* Include files */
#include "vlm_C_code_initialize.h"
#include "_coder_vlm_C_code_mex.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"

/* Function Definitions */
void vlm_C_code_initialize(void)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, NULL);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (vlm_C_code_initialize.c) */
