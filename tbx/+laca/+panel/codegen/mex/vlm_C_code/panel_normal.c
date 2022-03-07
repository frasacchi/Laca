/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * panel_normal.c
 *
 * Code generation for function 'panel_normal'
 *
 */

/* Include files */
#include "panel_normal.h"
#include "cross.h"
#include "eml_int_forloop_overflow_check.h"
#include "repmat.h"
#include "rt_nonfinite.h"
#include "sqrt.h"
#include "sum.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_emxutil.h"
#include "vlm_C_code_types.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo y_emlrtRSI =
    {
        71,      /* lineNo */
        "power", /* fcnName */
        "C:\\Program "
        "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\ops\\power.m" /* pathName
                                                                          */
};

static emlrtRSInfo db_emlrtRSI = {
    3,              /* lineNo */
    "panel_normal", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pathName
                                                                           */
};

static emlrtRSInfo eb_emlrtRSI = {
    4,              /* lineNo */
    "panel_normal", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pathName
                                                                           */
};

static emlrtRSInfo fb_emlrtRSI = {
    5,              /* lineNo */
    "panel_normal", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pathName
                                                                           */
};

static emlrtRSInfo gb_emlrtRSI = {
    6,              /* lineNo */
    "panel_normal", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pathName
                                                                           */
};

static emlrtRSInfo hb_emlrtRSI = {
    7,              /* lineNo */
    "panel_normal", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pathName
                                                                           */
};

static emlrtRSInfo ib_emlrtRSI = {
    8,              /* lineNo */
    "panel_normal", /* fcnName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pathName
                                                                           */
};

static emlrtRSInfo jb_emlrtRSI =
    {
        80,         /* lineNo */
        "fltpower", /* fcnName */
        "C:\\Program "
        "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\ops\\power.m" /* pathName
                                                                          */
};

static emlrtRSInfo kb_emlrtRSI = {
    52,      /* lineNo */
    "ixfun", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+internal\\ixfun.m" /* pathName
                                                                            */
};

static emlrtRSInfo lb_emlrtRSI = {
    66,                          /* lineNo */
    "applyBinaryScalarFunction", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyBinaryScalarFunction.m" /* pathName */
};

static emlrtRSInfo mb_emlrtRSI = {
    200,        /* lineNo */
    "flatIter", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyBinaryScalarFunction.m" /* pathName */
};

static emlrtRSInfo yb_emlrtRSI = {
    34,               /* lineNo */
    "rdivide_helper", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+internal\\rdivide_"
    "helper.m" /* pathName */
};

static emlrtRSInfo ac_emlrtRSI = {
    51,    /* lineNo */
    "div", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+internal\\div.m" /* pathName
                                                                          */
};

static emlrtRSInfo bc_emlrtRSI = {
    259,                    /* lineNo */
    "assertCompatibleSize", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+internal\\div.m" /* pathName
                                                                          */
};

static emlrtRSInfo cc_emlrtRSI = {
    45,                          /* lineNo */
    "applyBinaryScalarFunction", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyBinaryScalarFunction.m" /* pathName */
};

static emlrtRSInfo dc_emlrtRSI = {
    127,        /* lineNo */
    "flatIter", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyBinaryScalarFunction.m" /* pathName */
};

static emlrtRSInfo ec_emlrtRSI = {
    214,        /* lineNo */
    "flatIter", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyBinaryScalarFunction.m" /* pathName */
};

static emlrtRTEInfo k_emlrtRTEI = {
    19,             /* lineNo */
    23,             /* colNo */
    "scalexpAlloc", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+internal\\scalexpAlloc."
    "m" /* pName */
};

static emlrtECInfo f_emlrtECI = {
    2,              /* nDims */
    7,              /* lineNo */
    21,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtECInfo g_emlrtECI = {
    2,              /* nDims */
    7,              /* lineNo */
    17,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtECInfo h_emlrtECI = {
    3,              /* nDims */
    6,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtECInfo i_emlrtECI = {
    3,              /* nDims */
    5,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtECInfo j_emlrtECI = {
    3,              /* nDims */
    4,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtECInfo k_emlrtECI = {
    3,              /* nDims */
    3,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo pb_emlrtRTEI = {
    3,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo qb_emlrtRTEI = {
    3,              /* lineNo */
    32,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo rb_emlrtRTEI = {
    3,              /* lineNo */
    17,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo sb_emlrtRTEI = {
    4,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo tb_emlrtRTEI = {
    4,              /* lineNo */
    32,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo ub_emlrtRTEI = {
    4,              /* lineNo */
    17,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo vb_emlrtRTEI = {
    5,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo wb_emlrtRTEI = {
    5,              /* lineNo */
    32,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo xb_emlrtRTEI = {
    5,              /* lineNo */
    17,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo yb_emlrtRTEI = {
    6,              /* lineNo */
    18,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo ac_emlrtRTEI = {
    6,              /* lineNo */
    32,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo bc_emlrtRTEI = {
    6,              /* lineNo */
    17,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo cc_emlrtRTEI = {
    7,              /* lineNo */
    17,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo dc_emlrtRTEI = {
    7,              /* lineNo */
    21,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo ec_emlrtRTEI = {
    127,                         /* lineNo */
    6,                           /* colNo */
    "applyBinaryScalarFunction", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+"
    "internal\\applyBinaryScalarFunction.m" /* pName */
};

static emlrtRTEInfo fc_emlrtRTEI = {
    8,              /* lineNo */
    5,              /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo gc_emlrtRTEI = {
    1,              /* lineNo */
    16,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo hc_emlrtRTEI = {
    8,              /* lineNo */
    32,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

static emlrtRTEInfo ic_emlrtRTEI = {
    8,              /* lineNo */
    28,             /* colNo */
    "panel_normal", /* fName */
    "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\panel_normal.m" /* pName
                                                                           */
};

/* Function Definitions */
void panel_normal(const emlrtStack *sp, const emxArray_real_T *Panels,
                  emxArray_real_T *out)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack h_st;
  emlrtStack st;
  emxArray_real_T *b_Panels;
  emxArray_real_T *c_Panels;
  emxArray_real_T *r;
  emxArray_real_T *r1;
  emxArray_real_T *r2;
  emxArray_real_T *r3;
  emxArray_real_T *r4;
  emxArray_real_T *y;
  int32_T iv[3];
  int32_T iv1[3];
  int32_T iv2[2];
  int32_T z_size[2];
  int32_T b_calclen;
  int32_T c_calclen;
  int32_T calclen;
  int32_T d_calclen;
  int32_T loop_ub;
  int32_T nx;
  boolean_T b_p;
  boolean_T exitg1;
  boolean_T p;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  e_st.prev = &d_st;
  e_st.tls = d_st.tls;
  f_st.prev = &e_st;
  f_st.tls = e_st.tls;
  g_st.prev = &f_st;
  g_st.tls = f_st.tls;
  h_st.prev = &g_st;
  h_st.tls = g_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  emxInit_real_T(sp, &b_Panels, 3, &pb_emlrtRTEI, true);
  /* get the four cardinal points of the box */
  loop_ub = Panels->size[2];
  calclen = b_Panels->size[0] * b_Panels->size[1] * b_Panels->size[2];
  b_Panels->size[0] = 1;
  b_Panels->size[1] = 3;
  b_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, b_Panels, calclen, &pb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    b_Panels->data[3 * calclen] = Panels->data[12 * calclen];
    b_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 4];
    b_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 8];
  }
  emxInit_real_T(sp, &c_Panels, 3, &qb_emlrtRTEI, true);
  loop_ub = Panels->size[2];
  calclen = c_Panels->size[0] * c_Panels->size[1] * c_Panels->size[2];
  c_Panels->size[0] = 1;
  c_Panels->size[1] = 3;
  c_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, c_Panels, calclen, &qb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    c_Panels->data[3 * calclen] = Panels->data[12 * calclen + 1];
    c_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 5];
    c_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 9];
  }
  emxInit_real_T(sp, &r, 3, &gc_emlrtRTEI, true);
  iv[0] = (*(int32_T(*)[3])b_Panels->size)[0];
  iv[1] = (*(int32_T(*)[3])b_Panels->size)[1];
  iv[2] = (*(int32_T(*)[3])b_Panels->size)[2];
  iv1[0] = (*(int32_T(*)[3])c_Panels->size)[0];
  iv1[1] = (*(int32_T(*)[3])c_Panels->size)[1];
  iv1[2] = (*(int32_T(*)[3])c_Panels->size)[2];
  emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &k_emlrtECI, (emlrtCTX)sp);
  loop_ub = Panels->size[2];
  calclen = r->size[0] * r->size[1] * r->size[2];
  r->size[0] = 1;
  r->size[1] = 3;
  r->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, r, calclen, &rb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    r->data[3 * calclen] =
        (Panels->data[12 * calclen] + Panels->data[12 * calclen + 1]) / 2.0;
    r->data[3 * calclen + 1] =
        (Panels->data[12 * calclen + 4] + Panels->data[12 * calclen + 5]) / 2.0;
    r->data[3 * calclen + 2] =
        (Panels->data[12 * calclen + 8] + Panels->data[12 * calclen + 9]) / 2.0;
  }
  st.site = &db_emlrtRSI;
  nx = 3 * r->size[2];
  b_st.site = &h_emlrtRSI;
  b_calclen = nx / 3;
  if (b_calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  loop_ub = 3;
  if (r->size[2] > 3) {
    loop_ub = r->size[2];
  }
  if (b_calclen > muIntScalarMax_sint32(nx, loop_ub)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * b_calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  loop_ub = Panels->size[2];
  calclen = b_Panels->size[0] * b_Panels->size[1] * b_Panels->size[2];
  b_Panels->size[0] = 1;
  b_Panels->size[1] = 3;
  b_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, b_Panels, calclen, &sb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    b_Panels->data[3 * calclen] = Panels->data[12 * calclen + 1];
    b_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 5];
    b_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 9];
  }
  loop_ub = Panels->size[2];
  calclen = c_Panels->size[0] * c_Panels->size[1] * c_Panels->size[2];
  c_Panels->size[0] = 1;
  c_Panels->size[1] = 3;
  c_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, c_Panels, calclen, &tb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    c_Panels->data[3 * calclen] = Panels->data[12 * calclen + 2];
    c_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 6];
    c_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 10];
  }
  emxInit_real_T(sp, &r1, 3, &gc_emlrtRTEI, true);
  iv[0] = (*(int32_T(*)[3])b_Panels->size)[0];
  iv[1] = (*(int32_T(*)[3])b_Panels->size)[1];
  iv[2] = (*(int32_T(*)[3])b_Panels->size)[2];
  iv1[0] = (*(int32_T(*)[3])c_Panels->size)[0];
  iv1[1] = (*(int32_T(*)[3])c_Panels->size)[1];
  iv1[2] = (*(int32_T(*)[3])c_Panels->size)[2];
  emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &j_emlrtECI, (emlrtCTX)sp);
  loop_ub = Panels->size[2];
  calclen = r1->size[0] * r1->size[1] * r1->size[2];
  r1->size[0] = 1;
  r1->size[1] = 3;
  r1->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, r1, calclen, &ub_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    r1->data[3 * calclen] =
        (Panels->data[12 * calclen + 1] + Panels->data[12 * calclen + 2]) / 2.0;
    r1->data[3 * calclen + 1] =
        (Panels->data[12 * calclen + 5] + Panels->data[12 * calclen + 6]) / 2.0;
    r1->data[3 * calclen + 2] =
        (Panels->data[12 * calclen + 9] + Panels->data[12 * calclen + 10]) /
        2.0;
  }
  st.site = &eb_emlrtRSI;
  nx = 3 * r1->size[2];
  b_st.site = &h_emlrtRSI;
  c_calclen = nx / 3;
  if (c_calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  loop_ub = 3;
  if (r1->size[2] > 3) {
    loop_ub = r1->size[2];
  }
  if (c_calclen > muIntScalarMax_sint32(nx, loop_ub)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * c_calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  loop_ub = Panels->size[2];
  calclen = b_Panels->size[0] * b_Panels->size[1] * b_Panels->size[2];
  b_Panels->size[0] = 1;
  b_Panels->size[1] = 3;
  b_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, b_Panels, calclen, &vb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    b_Panels->data[3 * calclen] = Panels->data[12 * calclen + 2];
    b_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 6];
    b_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 10];
  }
  loop_ub = Panels->size[2];
  calclen = c_Panels->size[0] * c_Panels->size[1] * c_Panels->size[2];
  c_Panels->size[0] = 1;
  c_Panels->size[1] = 3;
  c_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, c_Panels, calclen, &wb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    c_Panels->data[3 * calclen] = Panels->data[12 * calclen + 3];
    c_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 7];
    c_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 11];
  }
  emxInit_real_T(sp, &r2, 3, &gc_emlrtRTEI, true);
  iv[0] = (*(int32_T(*)[3])b_Panels->size)[0];
  iv[1] = (*(int32_T(*)[3])b_Panels->size)[1];
  iv[2] = (*(int32_T(*)[3])b_Panels->size)[2];
  iv1[0] = (*(int32_T(*)[3])c_Panels->size)[0];
  iv1[1] = (*(int32_T(*)[3])c_Panels->size)[1];
  iv1[2] = (*(int32_T(*)[3])c_Panels->size)[2];
  emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &i_emlrtECI, (emlrtCTX)sp);
  loop_ub = Panels->size[2];
  calclen = r2->size[0] * r2->size[1] * r2->size[2];
  r2->size[0] = 1;
  r2->size[1] = 3;
  r2->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, r2, calclen, &xb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    r2->data[3 * calclen] =
        (Panels->data[12 * calclen + 2] + Panels->data[12 * calclen + 3]) / 2.0;
    r2->data[3 * calclen + 1] =
        (Panels->data[12 * calclen + 6] + Panels->data[12 * calclen + 7]) / 2.0;
    r2->data[3 * calclen + 2] =
        (Panels->data[12 * calclen + 10] + Panels->data[12 * calclen + 11]) /
        2.0;
  }
  st.site = &fb_emlrtRSI;
  nx = 3 * r2->size[2];
  b_st.site = &h_emlrtRSI;
  d_calclen = nx / 3;
  if (d_calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  loop_ub = 3;
  if (r2->size[2] > 3) {
    loop_ub = r2->size[2];
  }
  if (d_calclen > muIntScalarMax_sint32(nx, loop_ub)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * d_calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  loop_ub = Panels->size[2];
  calclen = b_Panels->size[0] * b_Panels->size[1] * b_Panels->size[2];
  b_Panels->size[0] = 1;
  b_Panels->size[1] = 3;
  b_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, b_Panels, calclen, &yb_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    b_Panels->data[3 * calclen] = Panels->data[12 * calclen + 3];
    b_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 7];
    b_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 11];
  }
  loop_ub = Panels->size[2];
  calclen = c_Panels->size[0] * c_Panels->size[1] * c_Panels->size[2];
  c_Panels->size[0] = 1;
  c_Panels->size[1] = 3;
  c_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, c_Panels, calclen, &ac_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    c_Panels->data[3 * calclen] = Panels->data[12 * calclen];
    c_Panels->data[3 * calclen + 1] = Panels->data[12 * calclen + 4];
    c_Panels->data[3 * calclen + 2] = Panels->data[12 * calclen + 8];
  }
  iv[0] = (*(int32_T(*)[3])b_Panels->size)[0];
  iv[1] = (*(int32_T(*)[3])b_Panels->size)[1];
  iv[2] = (*(int32_T(*)[3])b_Panels->size)[2];
  iv1[0] = (*(int32_T(*)[3])c_Panels->size)[0];
  iv1[1] = (*(int32_T(*)[3])c_Panels->size)[1];
  iv1[2] = (*(int32_T(*)[3])c_Panels->size)[2];
  emlrtSizeEqCheckNDR2012b(&iv[0], &iv1[0], &h_emlrtECI, (emlrtCTX)sp);
  loop_ub = Panels->size[2];
  calclen = b_Panels->size[0] * b_Panels->size[1] * b_Panels->size[2];
  b_Panels->size[0] = 1;
  b_Panels->size[1] = 3;
  b_Panels->size[2] = Panels->size[2];
  emxEnsureCapacity_real_T(sp, b_Panels, calclen, &bc_emlrtRTEI);
  emxFree_real_T(&c_Panels);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    b_Panels->data[3 * calclen] =
        (Panels->data[12 * calclen] + Panels->data[12 * calclen + 3]) / 2.0;
    b_Panels->data[3 * calclen + 1] =
        (Panels->data[12 * calclen + 4] + Panels->data[12 * calclen + 7]) / 2.0;
    b_Panels->data[3 * calclen + 2] =
        (Panels->data[12 * calclen + 8] + Panels->data[12 * calclen + 11]) /
        2.0;
  }
  st.site = &gb_emlrtRSI;
  nx = 3 * b_Panels->size[2];
  b_st.site = &h_emlrtRSI;
  calclen = nx / 3;
  if (calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  loop_ub = 3;
  if (b_Panels->size[2] > 3) {
    loop_ub = b_Panels->size[2];
  }
  if (calclen > muIntScalarMax_sint32(nx, loop_ub)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  z_size[0] = 3;
  z_size[1] = d_calclen;
  iv2[0] = 3;
  iv2[1] = b_calclen;
  if (d_calclen != b_calclen) {
    emlrtSizeEqCheckNDR2012b(&z_size[0], &iv2[0], &g_emlrtECI, (emlrtCTX)sp);
  }
  z_size[0] = 3;
  z_size[1] = c_calclen;
  iv2[0] = 3;
  iv2[1] = calclen;
  if (c_calclen != calclen) {
    emlrtSizeEqCheckNDR2012b(&z_size[0], &iv2[0], &f_emlrtECI, (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &y, 2, &hc_emlrtRTEI, true);
  calclen = y->size[0] * y->size[1];
  y->size[0] = 3;
  y->size[1] = d_calclen;
  emxEnsureCapacity_real_T(sp, y, calclen, &cc_emlrtRTEI);
  loop_ub = 3 * d_calclen;
  for (calclen = 0; calclen < loop_ub; calclen++) {
    y->data[calclen] = r2->data[calclen] - r->data[calclen];
  }
  emxFree_real_T(&r2);
  emxFree_real_T(&r);
  emxInit_real_T(sp, &r3, 2, &dc_emlrtRTEI, true);
  calclen = r3->size[0] * r3->size[1];
  r3->size[0] = 3;
  r3->size[1] = c_calclen;
  emxEnsureCapacity_real_T(sp, r3, calclen, &dc_emlrtRTEI);
  loop_ub = 3 * c_calclen;
  for (calclen = 0; calclen < loop_ub; calclen++) {
    r3->data[calclen] = r1->data[calclen] - b_Panels->data[calclen];
  }
  emxFree_real_T(&b_Panels);
  emxFree_real_T(&r1);
  st.site = &hb_emlrtRSI;
  cross(&st, y, r3, out);
  st.site = &ib_emlrtRSI;
  b_st.site = &ib_emlrtRSI;
  c_st.site = &y_emlrtRSI;
  d_st.site = &jb_emlrtRSI;
  e_st.site = &kb_emlrtRSI;
  f_st.site = &lb_emlrtRSI;
  calclen = y->size[0] * y->size[1];
  y->size[0] = 3;
  y->size[1] = out->size[1];
  emxEnsureCapacity_real_T(&f_st, y, calclen, &ec_emlrtRTEI);
  nx = 3 * out->size[1];
  g_st.site = &mb_emlrtRSI;
  emxFree_real_T(&r3);
  if ((1 <= nx) && (nx > 2147483646)) {
    h_st.site = &o_emlrtRSI;
    check_forloop_overflow_error(&h_st);
  }
  for (loop_ub = 0; loop_ub < nx; loop_ub++) {
    y->data[loop_ub] = out->data[loop_ub] * out->data[loop_ub];
  }
  emxInit_real_T(&f_st, &r4, 2, &ic_emlrtRTEI, true);
  b_st.site = &ib_emlrtRSI;
  b_sum(&b_st, y, r4);
  b_st.site = &ib_emlrtRSI;
  b_sqrt(&b_st, r4);
  b_st.site = &ib_emlrtRSI;
  repmat(&b_st, r4, y);
  b_st.site = &yb_emlrtRSI;
  c_st.site = &ac_emlrtRSI;
  d_st.site = &bc_emlrtRSI;
  e_st.site = &kb_emlrtRSI;
  f_st.site = &cc_emlrtRSI;
  z_size[0] = 3;
  if (out->size[1] <= y->size[1]) {
    z_size[1] = out->size[1];
  } else {
    z_size[1] = y->size[1];
  }
  p = true;
  b_p = true;
  loop_ub = 0;
  emxFree_real_T(&r4);
  exitg1 = false;
  while ((!exitg1) && (loop_ub < 2)) {
    if (z_size[loop_ub] != out->size[loop_ub]) {
      b_p = false;
      exitg1 = true;
    } else {
      loop_ub++;
    }
  }
  if (b_p) {
    b_p = true;
    loop_ub = 0;
    exitg1 = false;
    while ((!exitg1) && (loop_ub < 2)) {
      if (z_size[loop_ub] != y->size[loop_ub]) {
        b_p = false;
        exitg1 = true;
      } else {
        loop_ub++;
      }
    }
    if (!b_p) {
      p = false;
    }
  } else {
    p = false;
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(&f_st, &k_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  f_st.site = &lb_emlrtRSI;
  g_st.site = &dc_emlrtRSI;
  z_size[0] = 3;
  if (out->size[1] <= y->size[1]) {
    z_size[1] = out->size[1];
  } else {
    z_size[1] = y->size[1];
  }
  p = true;
  b_p = true;
  loop_ub = 0;
  exitg1 = false;
  while ((!exitg1) && (loop_ub < 2)) {
    if (z_size[loop_ub] != out->size[loop_ub]) {
      b_p = false;
      exitg1 = true;
    } else {
      loop_ub++;
    }
  }
  if (b_p) {
    b_p = true;
    loop_ub = 0;
    exitg1 = false;
    while ((!exitg1) && (loop_ub < 2)) {
      if (z_size[loop_ub] != y->size[loop_ub]) {
        b_p = false;
        exitg1 = true;
      } else {
        loop_ub++;
      }
    }
    if (!b_p) {
      p = false;
    }
  } else {
    p = false;
  }
  if (!p) {
    emlrtErrorWithMessageIdR2018a(&g_st, &k_emlrtRTEI, "MATLAB:dimagree",
                                  "MATLAB:dimagree", 0);
  }
  if (out->size[1] <= y->size[1]) {
    nx = out->size[1];
  } else {
    nx = y->size[1];
  }
  loop_ub = 3 * nx;
  g_st.site = &ec_emlrtRSI;
  if ((1 <= loop_ub) && (loop_ub > 2147483646)) {
    h_st.site = &o_emlrtRSI;
    check_forloop_overflow_error(&h_st);
  }
  loop_ub = 3 * out->size[1];
  calclen = out->size[0] * out->size[1];
  out->size[0] = 3;
  emxEnsureCapacity_real_T(&b_st, out, calclen, &fc_emlrtRTEI);
  for (calclen = 0; calclen < loop_ub; calclen++) {
    out->data[calclen] /= y->data[calclen];
  }
  emxFree_real_T(&y);
  /*              for i = 1:obj.NPanels */
  /*                 n = cross(... */
  /*                     (obj.Panels(3,:,i)-obj.Panels(3,:,i))',... */
  /*                     (obj.Panels(2,:,i)-obj.Panels(4,:,i))'... */
  /*                     );  */
  /*                 out(:,i) = n/norm(n); */
  /*              end */
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (panel_normal.c) */
