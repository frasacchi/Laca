/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * induced_velocity.c
 *
 * Code generation for function 'induced_velocity'
 *
 */

/* Include files */
#include "induced_velocity.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_types.h"
#include "vortex_ring.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo lc_emlrtRSI =
    {
        8,                  /* lineNo */
        "induced_velocity", /* fcnName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m" /* pathName */
};

static emlrtRSInfo mc_emlrtRSI =
    {
        15,                 /* lineNo */
        "induced_velocity", /* fcnName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m" /* pathName */
};

static emlrtBCInfo rb_emlrtBCI =
    {
        -1,                 /* iFirst */
        -1,                 /* iLast */
        7,                  /* lineNo */
        24,                 /* colNo */
        "rings",            /* aName */
        "induced_velocity", /* fName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m", /* pName */
        0    /* checkKind */
};

static emlrtBCInfo sb_emlrtBCI =
    {
        -1,                 /* iFirst */
        -1,                 /* iLast */
        13,                 /* lineNo */
        18,                 /* colNo */
        "te_idx",           /* aName */
        "induced_velocity", /* fName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m", /* pName */
        0    /* checkKind */
};

static emlrtBCInfo tb_emlrtBCI =
    {
        -1,                 /* iFirst */
        -1,                 /* iLast */
        14,                 /* lineNo */
        27,                 /* colNo */
        "te_rings",         /* aName */
        "induced_velocity", /* fName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m", /* pName */
        0    /* checkKind */
};

static emlrtBCInfo ub_emlrtBCI =
    {
        -1,                 /* iFirst */
        -1,                 /* iLast */
        8,                  /* lineNo */
        49,                 /* colNo */
        "gamma",            /* aName */
        "induced_velocity", /* fName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m", /* pName */
        0    /* checkKind */
};

static emlrtBCInfo vb_emlrtBCI =
    {
        -1,                 /* iFirst */
        -1,                 /* iLast */
        15,                 /* lineNo */
        49,                 /* colNo */
        "gamma",            /* aName */
        "induced_velocity", /* fName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m", /* pName */
        0    /* checkKind */
};

static emlrtDCInfo e_emlrtDCI =
    {
        15,                 /* lineNo */
        49,                 /* colNo */
        "induced_velocity", /* fName */
        "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\induced_velocity."
        "m", /* pName */
        1    /* checkKind */
};

/* Function Definitions */
void induced_velocity(const emlrtStack *sp, const real_T point[3],
                      const emxArray_real_T *rings,
                      const emxArray_real_T *te_rings,
                      const emxArray_real_T *te_idx,
                      const emxArray_real_T *b_gamma, real_T V[3])
{
  emlrtStack st;
  real_T b_rings[12];
  real_T dv[3];
  int32_T b_i;
  int32_T i;
  int32_T i1;
  int32_T rings_tmp;
  st.prev = sp;
  st.tls = sp->tls;
  /* GENERATE_AIC Summary of this function goes here */
  /*    Detailed explanation goes here */
  V[0] = 0.0;
  V[1] = 0.0;
  V[2] = 0.0;
  i = rings->size[2];
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, rings->size[2], &rb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    for (i1 = 0; i1 < 4; i1++) {
      rings_tmp = i1 + 12 * b_i;
      b_rings[3 * i1] = rings->data[rings_tmp];
      b_rings[3 * i1 + 1] = rings->data[rings_tmp + 4];
      b_rings[3 * i1 + 2] = rings->data[rings_tmp + 8];
    }
    if (b_i + 1 > b_gamma->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, b_gamma->size[0], &ub_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    st.site = &lc_emlrtRSI;
    b_vortex_ring(&st, b_rings, point, b_gamma->data[b_i], dv);
    V[0] += dv[0];
    V[1] += dv[1];
    V[2] += dv[2];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  /* compute influence of wake panels */
  i = te_idx->size[0];
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > te_idx->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, te_idx->size[0], &sb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > te_rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, te_rings->size[2], &tb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    for (i1 = 0; i1 < 4; i1++) {
      rings_tmp = i1 + 12 * b_i;
      b_rings[3 * i1] = te_rings->data[rings_tmp];
      b_rings[3 * i1 + 1] = te_rings->data[rings_tmp + 4];
      b_rings[3 * i1 + 2] = te_rings->data[rings_tmp + 8];
    }
    if (te_idx->data[b_i + te_idx->size[0]] !=
        (int32_T)muDoubleScalarFloor(te_idx->data[b_i + te_idx->size[0]])) {
      emlrtIntegerCheckR2012b(te_idx->data[b_i + te_idx->size[0]], &e_emlrtDCI,
                              (emlrtCTX)sp);
    }
    i1 = (int32_T)te_idx->data[b_i + te_idx->size[0]];
    if ((i1 < 1) || (i1 > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, b_gamma->size[0], &vb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    st.site = &mc_emlrtRSI;
    b_vortex_ring(&st, b_rings, point, b_gamma->data[i1 - 1], dv);
    V[0] += dv[0];
    V[1] += dv[1];
    V[2] += dv[2];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
}

/* End of code generation (induced_velocity.c) */
