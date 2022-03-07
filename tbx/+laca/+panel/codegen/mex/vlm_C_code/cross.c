/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * cross.c
 *
 * Code generation for function 'cross'
 *
 */

/* Include files */
#include "cross.h"
#include "eml_int_forloop_overflow_check.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_emxutil.h"
#include "vlm_C_code_types.h"

/* Variable Definitions */
static emlrtRSInfo k_emlrtRSI = {
    53,      /* lineNo */
    "cross", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\specfun\\cross.m" /* pathName
                                                                          */
};

static emlrtRSInfo l_emlrtRSI = {
    67,      /* lineNo */
    "cross", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\specfun\\cross.m" /* pathName
                                                                          */
};

static emlrtRSInfo m_emlrtRSI = {
    69,      /* lineNo */
    "cross", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\specfun\\cross.m" /* pathName
                                                                          */
};

static emlrtRTEInfo e_emlrtRTEI = {
    36,      /* lineNo */
    19,      /* colNo */
    "cross", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\specfun\\cross.m" /* pName
                                                                          */
};

static emlrtRTEInfo f_emlrtRTEI = {
    46,      /* lineNo */
    23,      /* colNo */
    "cross", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\specfun\\cross.m" /* pName
                                                                          */
};

static emlrtRTEInfo g_emlrtRTEI = {
    49,      /* lineNo */
    19,      /* colNo */
    "cross", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\specfun\\cross.m" /* pName
                                                                          */
};

static emlrtRTEInfo bb_emlrtRTEI = {
    38,      /* lineNo */
    24,      /* colNo */
    "cross", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\specfun\\cross.m" /* pName
                                                                          */
};

/* Function Definitions */
void cross(const emlrtStack *sp, const emxArray_real_T *a,
           const emxArray_real_T *b, emxArray_real_T *c)
{
  emlrtStack b_st;
  emlrtStack st;
  int32_T dim;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  int32_T iNext;
  int32_T iStart;
  int32_T nHigh;
  int32_T stride;
  int32_T stridem1;
  uint32_T varargin_1[2];
  uint32_T varargin_2[2];
  boolean_T exitg1;
  boolean_T overflow;
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  varargin_1[0] = 3U;
  varargin_2[0] = 3U;
  varargin_1[1] = (uint32_T)a->size[1];
  varargin_2[1] = (uint32_T)b->size[1];
  p = true;
  nHigh = 0;
  exitg1 = false;
  while ((!exitg1) && (nHigh < 2)) {
    if ((int32_T)varargin_1[nHigh] != (int32_T)varargin_2[nHigh]) {
      p = false;
      exitg1 = true;
    } else {
      nHigh++;
    }
  }
  overflow = (int32_T)p;
  if (!overflow) {
    emlrtErrorWithMessageIdR2018a(sp, &e_emlrtRTEI,
                                  "MATLAB:cross:InputSizeMismatch",
                                  "MATLAB:cross:InputSizeMismatch", 0);
  }
  nHigh = c->size[0] * c->size[1];
  c->size[0] = 3;
  c->size[1] = a->size[1];
  emxEnsureCapacity_real_T(sp, c, nHigh, &bb_emlrtRTEI);
  if (a->size[1] != 0) {
    dim = 0;
    nHigh = 0;
    exitg1 = false;
    while ((!exitg1) && (nHigh < 2)) {
      if (a->size[nHigh] == 3) {
        dim = nHigh + 1;
        exitg1 = true;
      } else {
        nHigh++;
      }
    }
    if (dim < 1) {
      emlrtErrorWithMessageIdR2018a(sp, &f_emlrtRTEI,
                                    "MATLAB:cross:InvalidDimAorB",
                                    "MATLAB:cross:InvalidDimAorB", 0);
    }
    if ((a->size[1] == 1) && (b->size[1] == 1)) {
      varargin_1[0] = 3U;
      varargin_2[0] = 3U;
      varargin_1[1] = (uint32_T)a->size[1];
      varargin_2[1] = (uint32_T)b->size[1];
      p = true;
      nHigh = 0;
      exitg1 = false;
      while ((!exitg1) && (nHigh < 2)) {
        if ((int32_T)varargin_1[nHigh] != (int32_T)varargin_2[nHigh]) {
          p = false;
          exitg1 = true;
        } else {
          nHigh++;
        }
      }
      overflow = (int32_T)p;
      if (!overflow) {
        emlrtErrorWithMessageIdR2018a(
            sp, &g_emlrtRTEI, "Coder:toolbox:variableSizeMatrixToVector",
            "Coder:toolbox:variableSizeMatrixToVector", 0);
      }
    }
    if (dim >= 2) {
      st.site = &k_emlrtRSI;
      stride = 3;
      stridem1 = 2;
    } else {
      stride = 1;
      stridem1 = 0;
    }
    iNext = stride * 3;
    if (dim >= 2) {
      nHigh = 1;
    } else {
      nHigh = iNext * (a->size[1] - 1) + 1;
    }
    st.site = &l_emlrtRSI;
    overflow = ((1 <= nHigh) && (nHigh > MAX_int32_T - iNext));
    if (overflow) {
      b_st.site = &o_emlrtRSI;
      check_forloop_overflow_error(&b_st);
    }
    for (iStart = 1; iNext < 0 ? iStart >= nHigh : iStart <= nHigh;
         iStart += iNext) {
      dim = iStart + stridem1;
      st.site = &m_emlrtRSI;
      if ((iStart <= dim) && (dim > 2147483646)) {
        b_st.site = &o_emlrtRSI;
        check_forloop_overflow_error(&b_st);
      }
      for (i1 = iStart; i1 <= dim; i1++) {
        i2 = (i1 + stride) - 1;
        i3 = i2 + stride;
        c->data[i1 - 1] = a->data[i2] * b->data[i3] - a->data[i3] * b->data[i2];
        c->data[i2] =
            a->data[i3] * b->data[i1 - 1] - a->data[i1 - 1] * b->data[i3];
        c->data[i3] =
            a->data[i1 - 1] * b->data[i2] - a->data[i2] * b->data[i1 - 1];
      }
    }
  }
}

/* End of code generation (cross.c) */
