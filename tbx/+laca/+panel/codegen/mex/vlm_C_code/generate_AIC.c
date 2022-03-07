/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * generate_AIC.c
 *
 * Code generation for function 'generate_AIC'
 *
 */

/* Include files */
#include "generate_AIC.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_emxutil.h"
#include "vlm_C_code_types.h"
#include "vortex_ring.h"
#include "blas.h"
#include "mwmathutil.h"
#include <stddef.h>

/* Variable Definitions */
static emlrtRSInfo q_emlrtRSI = {
    9,              /* lineNo */
    "generate_AIC", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m" /* pathName
                                                                           */
};

static emlrtRSInfo r_emlrtRSI = {
    19,             /* lineNo */
    "generate_AIC", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m" /* pathName
                                                                           */
};

static emlrtBCInfo h_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    7,              /* lineNo */
    24,             /* colNo */
    "rings",        /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo i_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    9,              /* lineNo */
    57,             /* colNo */
    "collocation",  /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo j_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    10,             /* lineNo */
    35,             /* colNo */
    "normal",       /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo k_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    17,             /* lineNo */
    27,             /* colNo */
    "te_rings",     /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo l_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    19,             /* lineNo */
    57,             /* colNo */
    "collocation",  /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo m_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    20,             /* lineNo */
    50,             /* colNo */
    "normal",       /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo n_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    16,             /* lineNo */
    11,             /* colNo */
    "te_idx",       /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo o_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    10,             /* lineNo */
    9,              /* colNo */
    "AIC",          /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo p_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    20,             /* lineNo */
    22,             /* colNo */
    "AIC",          /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtBCInfo q_emlrtBCI = {
    -1,             /* iFirst */
    -1,             /* iLast */
    20,             /* lineNo */
    9,              /* colNo */
    "AIC",          /* aName */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    0 /* checkKind */
};

static emlrtDCInfo d_emlrtDCI = {
    20,             /* lineNo */
    9,              /* colNo */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m", /* pName
                                                                            */
    1 /* checkKind */
};

static emlrtRTEInfo db_emlrtRTEI = {
    5,              /* lineNo */
    1,              /* colNo */
    "generate_AIC", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_AIC.m" /* pName
                                                                           */
};

/* Function Definitions */
void generate_AIC(const emlrtStack *sp, const emxArray_real_T *rings,
                  const emxArray_real_T *collocation,
                  const emxArray_real_T *normal,
                  const emxArray_real_T *te_rings,
                  const emxArray_real_T *te_idx, emxArray_real_T *AIC)
{
  ptrdiff_t incx_t;
  ptrdiff_t incy_t;
  ptrdiff_t n_t;
  emlrtStack st;
  real_T coords[12];
  real_T a_data[3];
  real_T b_data[3];
  real_T v[3];
  real_T c;
  real_T idx;
  int32_T N;
  int32_T b_i;
  int32_T i;
  int32_T i1;
  int32_T j;
  int32_T loop_ub;
  st.prev = sp;
  st.tls = sp->tls;
  /* GENERATE_AIC Summary of this function goes here */
  /*    Detailed explanation goes here */
  N = rings->size[2] - 1;
  i = AIC->size[0] * AIC->size[1];
  AIC->size[0] = rings->size[2];
  AIC->size[1] = rings->size[2];
  emxEnsureCapacity_real_T(sp, AIC, i, &db_emlrtRTEI);
  loop_ub = rings->size[2] * rings->size[2];
  for (i = 0; i < loop_ub; i++) {
    AIC->data[i] = 0.0;
  }
  i = rings->size[2];
  for (j = 0; j < i; j++) {
    if (j + 1 > rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(j + 1, 1, rings->size[2], &h_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    for (i1 = 0; i1 < 4; i1++) {
      loop_ub = i1 + 12 * j;
      coords[3 * i1] = rings->data[loop_ub];
      coords[3 * i1 + 1] = rings->data[loop_ub + 4];
      coords[3 * i1 + 2] = rings->data[loop_ub + 8];
    }
    for (b_i = 0; b_i <= N; b_i++) {
      if (b_i + 1 > collocation->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, collocation->size[1],
                                      &i_emlrtBCI, (emlrtCTX)sp);
      }
      st.site = &q_emlrtRSI;
      b_vortex_ring(&st, coords, *(real_T(*)[3]) & collocation->data[3 * b_i],
                    1.0, v);
      if (b_i + 1 > normal->size[1]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, normal->size[1], &j_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      a_data[0] = v[0];
      b_data[0] = normal->data[3 * b_i];
      a_data[1] = v[1];
      b_data[1] = normal->data[3 * b_i + 1];
      a_data[2] = v[2];
      b_data[2] = normal->data[3 * b_i + 2];
      n_t = (ptrdiff_t)3;
      incx_t = (ptrdiff_t)1;
      incy_t = (ptrdiff_t)1;
      if (b_i + 1 > AIC->size[0]) {
        emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, AIC->size[0], &o_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (j + 1 > AIC->size[1]) {
        emlrtDynamicBoundsCheckR2012b(j + 1, 1, AIC->size[1], &o_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      AIC->data[b_i + AIC->size[0] * j] =
          ddot(&n_t, &a_data[0], &incx_t, &b_data[0], &incy_t);
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  /* compute influence of wake panels */
  i = te_idx->size[0];
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > te_idx->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, te_idx->size[0], &n_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    idx = te_idx->data[b_i + te_idx->size[0]];
    if (b_i + 1 > te_rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, te_rings->size[2], &k_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    for (i1 = 0; i1 < 4; i1++) {
      loop_ub = i1 + 12 * b_i;
      coords[3 * i1] = te_rings->data[loop_ub];
      coords[3 * i1 + 1] = te_rings->data[loop_ub + 4];
      coords[3 * i1 + 2] = te_rings->data[loop_ub + 8];
    }
    for (j = 0; j <= N; j++) {
      if (j + 1 > collocation->size[1]) {
        emlrtDynamicBoundsCheckR2012b(j + 1, 1, collocation->size[1],
                                      &l_emlrtBCI, (emlrtCTX)sp);
      }
      st.site = &r_emlrtRSI;
      b_vortex_ring(&st, coords, *(real_T(*)[3]) & collocation->data[3 * j],
                    1.0, v);
      if (j + 1 > normal->size[1]) {
        emlrtDynamicBoundsCheckR2012b(j + 1, 1, normal->size[1], &m_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      a_data[0] = v[0];
      b_data[0] = normal->data[3 * j];
      a_data[1] = v[1];
      b_data[1] = normal->data[3 * j + 1];
      a_data[2] = v[2];
      b_data[2] = normal->data[3 * j + 2];
      n_t = (ptrdiff_t)3;
      incx_t = (ptrdiff_t)1;
      incy_t = (ptrdiff_t)1;
      c = ddot(&n_t, &a_data[0], &incx_t, &b_data[0], &incy_t);
      if (j + 1 > AIC->size[0]) {
        emlrtDynamicBoundsCheckR2012b(j + 1, 1, AIC->size[0], &p_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (((int32_T)idx < 1) || ((int32_T)idx > AIC->size[1])) {
        emlrtDynamicBoundsCheckR2012b((int32_T)idx, 1, AIC->size[1],
                                      &p_emlrtBCI, (emlrtCTX)sp);
      }
      if (j + 1 > AIC->size[0]) {
        emlrtDynamicBoundsCheckR2012b(j + 1, 1, AIC->size[0], &q_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      if (idx != (int32_T)muDoubleScalarFloor(idx)) {
        emlrtIntegerCheckR2012b(idx, &d_emlrtDCI, (emlrtCTX)sp);
      }
      if (((int32_T)idx < 1) || ((int32_T)idx > AIC->size[1])) {
        emlrtDynamicBoundsCheckR2012b((int32_T)idx, 1, AIC->size[1],
                                      &q_emlrtBCI, (emlrtCTX)sp);
      }
      AIC->data[j + AIC->size[0] * ((int32_T)idx - 1)] += c;
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b((emlrtCTX)sp);
      }
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
}

/* End of code generation (generate_AIC.c) */
