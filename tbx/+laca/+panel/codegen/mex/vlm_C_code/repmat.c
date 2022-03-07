/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * repmat.c
 *
 * Code generation for function 'repmat'
 *
 */

/* Include files */
#include "repmat.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_emxutil.h"
#include "vlm_C_code_types.h"

/* Variable Definitions */
static emlrtRSInfo p_emlrtRSI = {
    66,       /* lineNo */
    "repmat", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\repmat.m" /* pathName
                                                                         */
};

static emlrtRTEInfo cb_emlrtRTEI = {
    59,       /* lineNo */
    28,       /* colNo */
    "repmat", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\repmat.m" /* pName
                                                                         */
};

/* Function Definitions */
void repmat(const emlrtStack *sp, const emxArray_real_T *a, emxArray_real_T *b)
{
  emlrtStack b_st;
  emlrtStack st;
  int32_T ibmat;
  int32_T jcol;
  int32_T ncols;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  ncols = b->size[0] * b->size[1];
  b->size[0] = 3;
  b->size[1] = a->size[1];
  emxEnsureCapacity_real_T(sp, b, ncols, &cb_emlrtRTEI);
  ncols = a->size[1];
  st.site = &p_emlrtRSI;
  if ((1 <= a->size[1]) && (a->size[1] > 2147483646)) {
    b_st.site = &o_emlrtRSI;
    check_forloop_overflow_error(&b_st);
  }
  for (jcol = 0; jcol < ncols; jcol++) {
    ibmat = jcol * 3;
    b->data[ibmat] = a->data[jcol];
    b->data[ibmat + 1] = a->data[jcol];
    b->data[ibmat + 2] = a->data[jcol];
  }
}

/* End of code generation (repmat.c) */
