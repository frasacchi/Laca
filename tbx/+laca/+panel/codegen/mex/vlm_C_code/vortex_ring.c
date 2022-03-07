/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * vortex_ring.c
 *
 * Code generation for function 'vortex_ring'
 *
 */

/* Include files */
#include "vortex_ring.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_types.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo s_emlrtRSI = {
    10,            /* lineNo */
    "vortex_ring", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_ring.m" /* pathName
                                                                          */
};

static emlrtBCInfo wb_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    9,             /* lineNo */
    21,            /* colNo */
    "p1",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo xb_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    9,             /* lineNo */
    36,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo yb_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    9,             /* lineNo */
    66,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo ac_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    10,            /* lineNo */
    17,            /* colNo */
    "p1",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo bc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    10,            /* lineNo */
    32,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo cc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    10,            /* lineNo */
    62,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo dc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    11,            /* lineNo */
    31,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo ec_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    11,            /* lineNo */
    61,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo fc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    17,            /* lineNo */
    15,            /* colNo */
    "p1",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo gc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    17,            /* lineNo */
    35,            /* colNo */
    "p1",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo hc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    17,            /* lineNo */
    55,            /* colNo */
    "p1",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo ic_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    18,            /* lineNo */
    15,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo jc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    18,            /* lineNo */
    35,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo kc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    18,            /* lineNo */
    55,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo lc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    25,            /* lineNo */
    15,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo mc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    25,            /* lineNo */
    44,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo nc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    25,            /* lineNo */
    73,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo oc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    26,            /* lineNo */
    15,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo pc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    26,            /* lineNo */
    44,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

static emlrtBCInfo qc_emlrtBCI = {
    -1,            /* iFirst */
    -1,            /* iLast */
    26,            /* lineNo */
    73,            /* colNo */
    "p2",          /* aName */
    "vortex_line", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\vortex_line.m", /* pName
                                                                           */
    0 /* checkKind */
};

/* Function Definitions */
void b_vortex_ring(const emlrtStack *sp, const real_T coords[12],
                   const real_T p[3], real_T b_gamma, real_T q[3])
{
  static const int8_T iv[5] = {1, 2, 3, 4, 1};
  emlrtStack b_st;
  emlrtStack st;
  real_T K;
  real_T a;
  real_T b_a;
  real_T b_r1cr2_idx_0_tmp_tmp;
  real_T b_r1cr2_idx_1_tmp;
  real_T b_r1cr2_idx_1_tmp_tmp;
  real_T c_r1cr2_idx_0_tmp;
  real_T c_r1cr2_idx_0_tmp_tmp;
  real_T d;
  real_T d1;
  real_T d2;
  real_T d3;
  real_T d4;
  real_T d5;
  real_T d_r1cr2_idx_0_tmp;
  real_T d_r1cr2_idx_0_tmp_tmp;
  real_T e_r1cr2_idx_0_tmp;
  real_T f_r1cr2_idx_0_tmp;
  real_T r1;
  real_T r1cr2_idx_0;
  real_T r1cr2_idx_0_tmp_tmp;
  real_T r1cr2_idx_1;
  real_T r1cr2_idx_1_tmp;
  real_T r1cr2_idx_1_tmp_tmp;
  real_T r1cr2_idx_2;
  real_T r1cr2_sq;
  real_T r2;
  int32_T b_r1cr2_idx_0_tmp;
  int32_T i;
  int32_T r1cr2_idx_0_tmp;
  boolean_T guard1 = false;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  /* VORTEX_RING calculates the induced velocity at point p from a vortix ring
   */
  /* specified by coords with strength gamma */
  /*    coords is a (3,N) matrix which are the N verticies of the ring in a */
  /*    clockwise order */
  d = p[2];
  d1 = p[1];
  d2 = p[0];
  d3 = 0.0;
  d4 = 0.0;
  d5 = 0.0;
  for (i = 0; i < 4; i++) {
    st.site = &s_emlrtRSI;
    /* VORTEX_LINE calculates the induced velocity at point p from a vortex line
     */
    /* between p1 and p2 with strenth gamma (right hand rule from p1 -> p2) */
    /*  get cross product of r1 and r2 */
    r1cr2_idx_0_tmp = 3 * (iv[i] - 1);
    b_r1cr2_idx_0_tmp = 3 * (iv[i + 1] - 1);
    r1cr2_idx_0_tmp_tmp = coords[b_r1cr2_idx_0_tmp + 2];
    c_r1cr2_idx_0_tmp = d - r1cr2_idx_0_tmp_tmp;
    b_r1cr2_idx_0_tmp_tmp = coords[r1cr2_idx_0_tmp + 2];
    d_r1cr2_idx_0_tmp = d - b_r1cr2_idx_0_tmp_tmp;
    c_r1cr2_idx_0_tmp_tmp = coords[b_r1cr2_idx_0_tmp + 1];
    e_r1cr2_idx_0_tmp = d1 - c_r1cr2_idx_0_tmp_tmp;
    d_r1cr2_idx_0_tmp_tmp = coords[r1cr2_idx_0_tmp + 1];
    f_r1cr2_idx_0_tmp = d1 - d_r1cr2_idx_0_tmp_tmp;
    r1cr2_idx_0 = f_r1cr2_idx_0_tmp * c_r1cr2_idx_0_tmp -
                  d_r1cr2_idx_0_tmp * e_r1cr2_idx_0_tmp;
    r1cr2_idx_1_tmp_tmp = coords[r1cr2_idx_0_tmp];
    r1cr2_idx_1_tmp = d2 - r1cr2_idx_1_tmp_tmp;
    b_r1cr2_idx_1_tmp_tmp = coords[b_r1cr2_idx_0_tmp];
    b_r1cr2_idx_1_tmp = d2 - b_r1cr2_idx_1_tmp_tmp;
    r1cr2_idx_1 = -r1cr2_idx_1_tmp * c_r1cr2_idx_0_tmp +
                  d_r1cr2_idx_0_tmp * b_r1cr2_idx_1_tmp;
    r1cr2_idx_2 = r1cr2_idx_1_tmp * e_r1cr2_idx_0_tmp -
                  f_r1cr2_idx_0_tmp * b_r1cr2_idx_1_tmp;
    /*  get square of norm of cross product */
    r1cr2_sq = (r1cr2_idx_0 * r1cr2_idx_0 + r1cr2_idx_1 * r1cr2_idx_1) +
               r1cr2_idx_2 * r1cr2_idx_2;
    /*  get r1 and r2 distances */
    K = r1cr2_idx_1_tmp_tmp - d2;
    a = d_r1cr2_idx_0_tmp_tmp - d1;
    b_a = b_r1cr2_idx_0_tmp_tmp - d;
    b_st.site = &u_emlrtRSI;
    r1 = (K * K + a * a) + b_a * b_a;
    if (r1 < 0.0) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &i_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
          "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
    }
    r1 = muDoubleScalarSqrt(r1);
    K = b_r1cr2_idx_1_tmp_tmp - d2;
    a = c_r1cr2_idx_0_tmp_tmp - d1;
    b_a = r1cr2_idx_0_tmp_tmp - d;
    b_st.site = &v_emlrtRSI;
    r2 = (K * K + a * a) + b_a * b_a;
    if (r2 < 0.0) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &i_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
          "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
    }
    r2 = muDoubleScalarSqrt(r2);
    /*  check not too close to vortex */
    guard1 = false;
    if ((r1 < 1.0E-6) || (r2 < 1.0E-6)) {
      guard1 = true;
    } else if (r1cr2_sq < 1.0E-12) {
      guard1 = true;
    } else {
      /*  get dot product r_0.r_1 and r_0.r_2 */
      /* get induced Velocity */
      b_a = b_r1cr2_idx_1_tmp_tmp - r1cr2_idx_1_tmp_tmp;
      a = c_r1cr2_idx_0_tmp_tmp - d_r1cr2_idx_0_tmp_tmp;
      K = r1cr2_idx_0_tmp_tmp - b_r1cr2_idx_0_tmp_tmp;
      K = b_gamma / (12.566370614359172 * r1cr2_sq) *
          (((b_a * r1cr2_idx_1_tmp + a * f_r1cr2_idx_0_tmp) +
            K * d_r1cr2_idx_0_tmp) /
               r1 -
           ((b_a * b_r1cr2_idx_1_tmp + a * e_r1cr2_idx_0_tmp) +
            K * c_r1cr2_idx_0_tmp) /
               r2);
      r1cr2_idx_0 *= K;
      r1cr2_idx_1 *= K;
      r1cr2_idx_2 *= K;
    }
    if (guard1) {
      r1cr2_idx_0 = 0.0;
      r1cr2_idx_1 = 0.0;
      r1cr2_idx_2 = 0.0;
    }
    d3 += r1cr2_idx_0;
    d4 += r1cr2_idx_1;
    d5 += r1cr2_idx_2;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  q[2] = d5;
  q[1] = d4;
  q[0] = d3;
}

void vortex_ring(const emlrtStack *sp, const emxArray_real_T *coords,
                 const real_T p[3], real_T b_gamma, real_T q[3])
{
  static const int8_T iv[4] = {1, 2, 3, 1};
  emlrtStack b_st;
  emlrtStack st;
  real_T K;
  real_T a;
  real_T b_a;
  real_T b_r1cr2_idx_0_tmp_tmp;
  real_T b_r1cr2_idx_1_tmp;
  real_T b_r1cr2_idx_1_tmp_tmp;
  real_T c_r1cr2_idx_0_tmp;
  real_T c_r1cr2_idx_0_tmp_tmp;
  real_T d;
  real_T d1;
  real_T d2;
  real_T d3;
  real_T d4;
  real_T d5;
  real_T d_r1cr2_idx_0_tmp;
  real_T d_r1cr2_idx_0_tmp_tmp;
  real_T e_r1cr2_idx_0_tmp;
  real_T f_r1cr2_idx_0_tmp;
  real_T r1;
  real_T r1cr2_idx_0;
  real_T r1cr2_idx_0_tmp_tmp;
  real_T r1cr2_idx_1;
  real_T r1cr2_idx_1_tmp;
  real_T r1cr2_idx_1_tmp_tmp;
  real_T r1cr2_idx_2;
  real_T r1cr2_sq;
  real_T r2;
  int32_T b_r1cr2_idx_0_tmp;
  int32_T i;
  int32_T r1cr2_idx_0_tmp;
  boolean_T guard1 = false;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  /* VORTEX_RING calculates the induced velocity at point p from a vortix ring
   */
  /* specified by coords with strength gamma */
  /*    coords is a (3,N) matrix which are the N verticies of the ring in a */
  /*    clockwise order */
  d = p[2];
  d1 = p[1];
  d2 = p[0];
  d3 = 0.0;
  d4 = 0.0;
  d5 = 0.0;
  for (i = 0; i < 3; i++) {
    st.site = &s_emlrtRSI;
    /* VORTEX_LINE calculates the induced velocity at point p from a vortex line
     */
    /* between p1 and p2 with strenth gamma (right hand rule from p1 -> p2) */
    /*  get cross product of r1 and r2 */
    if (2 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(2, 1, coords->size[0], &wb_emlrtBCI, &st);
    }
    if (3 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(3, 1, coords->size[0], &xb_emlrtBCI, &st);
    }
    if (2 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(2, 1, coords->size[0], &yb_emlrtBCI, &st);
    }
    if (1 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, coords->size[0], &ac_emlrtBCI, &st);
    }
    if (3 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(3, 1, coords->size[0], &bc_emlrtBCI, &st);
    }
    if (1 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, coords->size[0], &cc_emlrtBCI, &st);
    }
    if (2 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(2, 1, coords->size[0], &dc_emlrtBCI, &st);
    }
    if (1 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, coords->size[0], &ec_emlrtBCI, &st);
    }
    r1cr2_idx_0_tmp = iv[i] - 1;
    b_r1cr2_idx_0_tmp = iv[i + 1] - 1;
    r1cr2_idx_0_tmp_tmp = coords->data[coords->size[0] * b_r1cr2_idx_0_tmp + 2];
    c_r1cr2_idx_0_tmp = d - r1cr2_idx_0_tmp_tmp;
    b_r1cr2_idx_0_tmp_tmp = coords->data[coords->size[0] * r1cr2_idx_0_tmp + 2];
    d_r1cr2_idx_0_tmp = d - b_r1cr2_idx_0_tmp_tmp;
    c_r1cr2_idx_0_tmp_tmp =
        coords->data[coords->size[0] * b_r1cr2_idx_0_tmp + 1];
    e_r1cr2_idx_0_tmp = d1 - c_r1cr2_idx_0_tmp_tmp;
    d_r1cr2_idx_0_tmp_tmp = coords->data[coords->size[0] * r1cr2_idx_0_tmp + 1];
    f_r1cr2_idx_0_tmp = d1 - d_r1cr2_idx_0_tmp_tmp;
    r1cr2_idx_0 = f_r1cr2_idx_0_tmp * c_r1cr2_idx_0_tmp -
                  d_r1cr2_idx_0_tmp * e_r1cr2_idx_0_tmp;
    r1cr2_idx_1_tmp_tmp = coords->data[coords->size[0] * r1cr2_idx_0_tmp];
    r1cr2_idx_1_tmp = d2 - r1cr2_idx_1_tmp_tmp;
    b_r1cr2_idx_1_tmp_tmp = coords->data[coords->size[0] * b_r1cr2_idx_0_tmp];
    b_r1cr2_idx_1_tmp = d2 - b_r1cr2_idx_1_tmp_tmp;
    r1cr2_idx_1 = -r1cr2_idx_1_tmp * c_r1cr2_idx_0_tmp +
                  d_r1cr2_idx_0_tmp * b_r1cr2_idx_1_tmp;
    r1cr2_idx_2 = r1cr2_idx_1_tmp * e_r1cr2_idx_0_tmp -
                  f_r1cr2_idx_0_tmp * b_r1cr2_idx_1_tmp;
    /*  get square of norm of cross product */
    r1cr2_sq = (r1cr2_idx_0 * r1cr2_idx_0 + r1cr2_idx_1 * r1cr2_idx_1) +
               r1cr2_idx_2 * r1cr2_idx_2;
    /*  get r1 and r2 distances */
    if (1 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, coords->size[0], &fc_emlrtBCI, &st);
    }
    if (2 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(2, 1, coords->size[0], &gc_emlrtBCI, &st);
    }
    if (3 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(3, 1, coords->size[0], &hc_emlrtBCI, &st);
    }
    K = r1cr2_idx_1_tmp_tmp - d2;
    a = d_r1cr2_idx_0_tmp_tmp - d1;
    b_a = b_r1cr2_idx_0_tmp_tmp - d;
    b_st.site = &u_emlrtRSI;
    r1 = (K * K + a * a) + b_a * b_a;
    if (r1 < 0.0) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &i_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
          "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
    }
    r1 = muDoubleScalarSqrt(r1);
    if (1 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(1, 1, coords->size[0], &ic_emlrtBCI, &st);
    }
    if (2 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(2, 1, coords->size[0], &jc_emlrtBCI, &st);
    }
    if (3 > coords->size[0]) {
      emlrtDynamicBoundsCheckR2012b(3, 1, coords->size[0], &kc_emlrtBCI, &st);
    }
    K = b_r1cr2_idx_1_tmp_tmp - d2;
    a = c_r1cr2_idx_0_tmp_tmp - d1;
    b_a = r1cr2_idx_0_tmp_tmp - d;
    b_st.site = &v_emlrtRSI;
    r2 = (K * K + a * a) + b_a * b_a;
    if (r2 < 0.0) {
      emlrtErrorWithMessageIdR2018a(
          &b_st, &i_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
          "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
    }
    r2 = muDoubleScalarSqrt(r2);
    /*  check not too close to vortex */
    guard1 = false;
    if ((r1 < 1.0E-6) || (r2 < 1.0E-6)) {
      guard1 = true;
    } else if (r1cr2_sq < 1.0E-12) {
      guard1 = true;
    } else {
      /*  get dot product r_0.r_1 and r_0.r_2 */
      if (1 > coords->size[0]) {
        emlrtDynamicBoundsCheckR2012b(1, 1, coords->size[0], &lc_emlrtBCI, &st);
      }
      if (2 > coords->size[0]) {
        emlrtDynamicBoundsCheckR2012b(2, 1, coords->size[0], &mc_emlrtBCI, &st);
      }
      if (3 > coords->size[0]) {
        emlrtDynamicBoundsCheckR2012b(3, 1, coords->size[0], &nc_emlrtBCI, &st);
      }
      if (1 > coords->size[0]) {
        emlrtDynamicBoundsCheckR2012b(1, 1, coords->size[0], &oc_emlrtBCI, &st);
      }
      if (2 > coords->size[0]) {
        emlrtDynamicBoundsCheckR2012b(2, 1, coords->size[0], &pc_emlrtBCI, &st);
      }
      if (3 > coords->size[0]) {
        emlrtDynamicBoundsCheckR2012b(3, 1, coords->size[0], &qc_emlrtBCI, &st);
      }
      /* get induced Velocity */
      b_a = b_r1cr2_idx_1_tmp_tmp - r1cr2_idx_1_tmp_tmp;
      a = c_r1cr2_idx_0_tmp_tmp - d_r1cr2_idx_0_tmp_tmp;
      K = r1cr2_idx_0_tmp_tmp - b_r1cr2_idx_0_tmp_tmp;
      K = b_gamma / (12.566370614359172 * r1cr2_sq) *
          (((b_a * r1cr2_idx_1_tmp + a * f_r1cr2_idx_0_tmp) +
            K * d_r1cr2_idx_0_tmp) /
               r1 -
           ((b_a * b_r1cr2_idx_1_tmp + a * e_r1cr2_idx_0_tmp) +
            K * c_r1cr2_idx_0_tmp) /
               r2);
      r1cr2_idx_0 *= K;
      r1cr2_idx_1 *= K;
      r1cr2_idx_2 *= K;
    }
    if (guard1) {
      r1cr2_idx_0 = 0.0;
      r1cr2_idx_1 = 0.0;
      r1cr2_idx_2 = 0.0;
    }
    d3 += r1cr2_idx_0;
    d4 += r1cr2_idx_1;
    d5 += r1cr2_idx_2;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  q[2] = d5;
  q[1] = d4;
  q[0] = d3;
}

/* End of code generation (vortex_ring.c) */
