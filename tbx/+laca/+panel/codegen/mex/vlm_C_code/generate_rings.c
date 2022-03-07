/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * generate_rings.c
 *
 * Code generation for function 'generate_rings'
 *
 */

/* Include files */
#include "generate_rings.h"
#include "eml_int_forloop_overflow_check.h"
#include "indexShapeCheck.h"
#include "panel_normal.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_emxutil.h"
#include "vlm_C_code_types.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo
    ab_emlrtRSI =
        {
            21,               /* lineNo */
            "generate_rings", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pathName */
};

static emlrtRSInfo
    bb_emlrtRSI =
        {
            22,               /* lineNo */
            "generate_rings", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pathName */
};

static emlrtRSInfo
    cb_emlrtRSI =
        {
            26,               /* lineNo */
            "generate_rings", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pathName */
};

static emlrtRSInfo fc_emlrtRSI = {
    39,     /* lineNo */
    "find", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pathName
                                                                       */
};

static emlrtRSInfo gc_emlrtRSI = {
    144,        /* lineNo */
    "eml_find", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pathName
                                                                       */
};

static emlrtRSInfo hc_emlrtRSI = {
    382,                  /* lineNo */
    "find_first_indices", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pathName
                                                                       */
};

static emlrtRSInfo ic_emlrtRSI = {
    402,                  /* lineNo */
    "find_first_indices", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pathName
                                                                       */
};

static emlrtRSInfo kc_emlrtRSI = {
    22,    /* lineNo */
    "cat", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+internal\\cat.m" /* pathName
                                                                          */
};

static emlrtRTEInfo j_emlrtRTEI = {
    392,                  /* lineNo */
    1,                    /* colNo */
    "find_first_indices", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pName
                                                                       */
};

static emlrtBCInfo
    r_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            35,               /* lineNo */
            17,               /* colNo */
            "TERings",        /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    s_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            34,               /* lineNo */
            17,               /* colNo */
            "TERings",        /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    t_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            33,               /* lineNo */
            17,               /* colNo */
            "TERings",        /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    u_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            32,               /* lineNo */
            17,               /* colNo */
            "TERings",        /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    v_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            19,               /* lineNo */
            19,               /* colNo */
            "Collocation",    /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    w_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            35,               /* lineNo */
            32,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    x_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            34,               /* lineNo */
            32,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    y_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            33,               /* lineNo */
            32,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    ab_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            32,               /* lineNo */
            32,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    bb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            28,               /* lineNo */
            24,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    cb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            17,               /* lineNo */
            15,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    db_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            16,               /* lineNo */
            15,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    eb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            15,               /* lineNo */
            15,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    fb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            14,               /* lineNo */
            15,               /* colNo */
            "Rings",          /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    gb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            19,               /* lineNo */
            37,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    hb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            17,               /* lineNo */
            31,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    ib_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            16,               /* lineNo */
            31,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    jb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            15,               /* lineNo */
            31,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    kb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            14,               /* lineNo */
            31,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    lb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            12,               /* lineNo */
            21,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    mb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            9,                /* lineNo */
            20,               /* colNo */
            "panels",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    nb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            32,               /* lineNo */
            32,               /* colNo */
            "idx_te",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    ob_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            33,               /* lineNo */
            32,               /* colNo */
            "idx_te",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    pb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            34,               /* lineNo */
            32,               /* colNo */
            "idx_te",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    qb_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            35,               /* lineNo */
            32,               /* colNo */
            "idx_te",         /* aName */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m", /* pName */
            0          /* checkKind */
};

static emlrtRTEInfo
    eb_emlrtRTEI =
        {
            5,                /* lineNo */
            1,                /* colNo */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pName */
};

static emlrtRTEInfo
    fb_emlrtRTEI =
        {
            6,                /* lineNo */
            15,               /* colNo */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pName */
};

static emlrtRTEInfo gb_emlrtRTEI = {
    369,    /* lineNo */
    24,     /* colNo */
    "find", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pName
                                                                       */
};

static emlrtRTEInfo hb_emlrtRTEI = {
    39,     /* lineNo */
    5,      /* colNo */
    "find", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pName
                                                                       */
};

static emlrtRTEInfo
    ib_emlrtRTEI =
        {
            22,               /* lineNo */
            1,                /* colNo */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pName */
};

static emlrtRTEInfo
    jb_emlrtRTEI =
        {
            25,               /* lineNo */
            1,                /* colNo */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pName */
};

static emlrtRTEInfo kb_emlrtRTEI =
    {
        28,      /* lineNo */
        9,       /* colNo */
        "colon", /* fName */
        "C:\\Program "
        "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\ops\\colon.m" /* pName
                                                                          */
};

static emlrtRTEInfo
    lb_emlrtRTEI =
        {
            26,               /* lineNo */
            10,               /* colNo */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pName */
};

static emlrtRTEInfo
    mb_emlrtRTEI =
        {
            26,               /* lineNo */
            1,                /* colNo */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pName */
};

static emlrtRTEInfo nb_emlrtRTEI = {
    31,     /* lineNo */
    6,      /* colNo */
    "find", /* fName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m" /* pName
                                                                       */
};

static emlrtRTEInfo
    ob_emlrtRTEI =
        {
            26,               /* lineNo */
            11,               /* colNo */
            "generate_rings", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\generate_"
            "rings.m" /* pName */
};

/* Function Definitions */
void generate_rings(const emlrtStack *sp, const emxArray_real_T *panels,
                    const emxArray_boolean_T *isTE, emxArray_real_T *Rings,
                    emxArray_real_T *Normal, emxArray_real_T *Collocation,
                    emxArray_real_T *TERings, emxArray_real_T *TEidx)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack st;
  emxArray_int32_T *ii;
  emxArray_uint32_T *idx_te;
  emxArray_uint32_T *varargin_1;
  emxArray_uint32_T *y;
  real_T AD_idx_0;
  real_T AD_idx_1;
  real_T AD_idx_1_tmp;
  real_T AD_idx_2;
  real_T BC_idx_0;
  real_T BC_idx_1;
  real_T BC_idx_2;
  real_T TERings_tmp;
  real_T b_TERings_tmp;
  int32_T iv[2];
  int32_T AD_idx_2_tmp;
  int32_T BC_idx_0_tmp;
  int32_T BC_idx_1_tmp;
  int32_T BC_idx_2_tmp;
  int32_T b_AD_idx_2_tmp;
  int32_T b_BC_idx_0_tmp;
  int32_T b_BC_idx_1_tmp;
  int32_T b_BC_idx_2_tmp;
  int32_T b_i;
  int32_T i;
  int32_T idx;
  int32_T loop_ub;
  int32_T nx;
  boolean_T exitg1;
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
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  /* GENERATE_RINGS Summary of this function goes here */
  /*    Detailed explanation goes here */
  i = Rings->size[0] * Rings->size[1] * Rings->size[2];
  Rings->size[0] = 4;
  Rings->size[1] = 3;
  Rings->size[2] = panels->size[2];
  emxEnsureCapacity_real_T(sp, Rings, i, &eb_emlrtRTEI);
  loop_ub = 12 * panels->size[2];
  for (i = 0; i < loop_ub; i++) {
    Rings->data[i] = 0.0;
  }
  i = Collocation->size[0] * Collocation->size[1];
  Collocation->size[0] = 3;
  Collocation->size[1] = panels->size[2];
  emxEnsureCapacity_real_T(sp, Collocation, i, &fb_emlrtRTEI);
  i = panels->size[2];
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > panels->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, panels->size[2], &mb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    loop_ub = 12 * b_i + 3;
    AD_idx_0 = panels->data[loop_ub] - panels->data[12 * b_i];
    nx = 12 * b_i + 4;
    idx = 12 * b_i + 7;
    AD_idx_1 = panels->data[idx] - panels->data[nx];
    AD_idx_2_tmp = 12 * b_i + 8;
    b_AD_idx_2_tmp = 12 * b_i + 11;
    AD_idx_2 = panels->data[b_AD_idx_2_tmp] - panels->data[AD_idx_2_tmp];
    if (b_i + 1 > panels->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, panels->size[2], &lb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    BC_idx_0_tmp = 12 * b_i + 1;
    b_BC_idx_0_tmp = 12 * b_i + 2;
    BC_idx_0 = panels->data[b_BC_idx_0_tmp] - panels->data[BC_idx_0_tmp];
    BC_idx_1_tmp = 12 * b_i + 5;
    b_BC_idx_1_tmp = 12 * b_i + 6;
    BC_idx_1 = panels->data[b_BC_idx_1_tmp] - panels->data[BC_idx_1_tmp];
    BC_idx_2_tmp = 12 * b_i + 9;
    b_BC_idx_2_tmp = 12 * b_i + 10;
    BC_idx_2 = panels->data[b_BC_idx_2_tmp] - panels->data[BC_idx_2_tmp];
    if (b_i + 1 > panels->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, panels->size[2], &kb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Rings->size[2], &fb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    Rings->data[12 * b_i] = panels->data[12 * b_i] + 0.25 * AD_idx_0;
    Rings->data[nx] = panels->data[nx] + 0.25 * AD_idx_1;
    Rings->data[AD_idx_2_tmp] = panels->data[AD_idx_2_tmp] + 0.25 * AD_idx_2;
    if (b_i + 1 > panels->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, panels->size[2], &jb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Rings->size[2], &eb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    Rings->data[BC_idx_0_tmp] = panels->data[BC_idx_0_tmp] + 0.25 * BC_idx_0;
    Rings->data[BC_idx_1_tmp] = panels->data[BC_idx_1_tmp] + 0.25 * BC_idx_1;
    Rings->data[BC_idx_2_tmp] = panels->data[BC_idx_2_tmp] + 0.25 * BC_idx_2;
    if (b_i + 1 > panels->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, panels->size[2], &ib_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Rings->size[2], &db_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    Rings->data[b_BC_idx_0_tmp] = panels->data[BC_idx_0_tmp] + 1.25 * BC_idx_0;
    Rings->data[b_BC_idx_1_tmp] = panels->data[BC_idx_1_tmp] + 1.25 * BC_idx_1;
    Rings->data[b_BC_idx_2_tmp] = panels->data[BC_idx_2_tmp] + 1.25 * BC_idx_2;
    if (b_i + 1 > panels->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, panels->size[2], &hb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Rings->size[2], &cb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    Rings->data[loop_ub] = panels->data[12 * b_i] + 1.25 * AD_idx_0;
    Rings->data[idx] = panels->data[nx] + 1.25 * AD_idx_1;
    Rings->data[b_AD_idx_2_tmp] = panels->data[AD_idx_2_tmp] + 1.25 * AD_idx_2;
    if (b_i + 1 > panels->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, panels->size[2], &gb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > Collocation->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, Collocation->size[1],
                                    &v_emlrtBCI, (emlrtCTX)sp);
    }
    Collocation->data[3 * b_i] =
        ((panels->data[12 * b_i] + 0.75 * AD_idx_0) +
         (panels->data[BC_idx_0_tmp] + 0.75 * BC_idx_0)) /
        2.0;
    Collocation->data[3 * b_i + 1] =
        ((panels->data[nx] + 0.75 * AD_idx_1) +
         (panels->data[BC_idx_1_tmp] + 0.75 * BC_idx_1)) /
        2.0;
    Collocation->data[3 * b_i + 2] =
        ((panels->data[AD_idx_2_tmp] + 0.75 * AD_idx_2) +
         (panels->data[BC_idx_2_tmp] + 0.75 * BC_idx_2)) /
        2.0;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  emxInit_int32_T(sp, &ii, 1, &nb_emlrtRTEI, true);
  st.site = &ab_emlrtRSI;
  panel_normal(&st, Rings, Normal);
  st.site = &bb_emlrtRSI;
  b_st.site = &fc_emlrtRSI;
  nx = isTE->size[0];
  c_st.site = &gc_emlrtRSI;
  idx = 0;
  i = ii->size[0];
  ii->size[0] = isTE->size[0];
  emxEnsureCapacity_int32_T(&c_st, ii, i, &gb_emlrtRTEI);
  d_st.site = &hc_emlrtRSI;
  if ((1 <= isTE->size[0]) && (isTE->size[0] > 2147483646)) {
    e_st.site = &o_emlrtRSI;
    check_forloop_overflow_error(&e_st);
  }
  loop_ub = 0;
  exitg1 = false;
  while ((!exitg1) && (loop_ub <= nx - 1)) {
    if (isTE->data[loop_ub]) {
      idx++;
      ii->data[idx - 1] = loop_ub + 1;
      if (idx >= nx) {
        exitg1 = true;
      } else {
        loop_ub++;
      }
    } else {
      loop_ub++;
    }
  }
  if (idx > isTE->size[0]) {
    emlrtErrorWithMessageIdR2018a(&c_st, &j_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  if (isTE->size[0] == 1) {
    if (idx == 0) {
      ii->size[0] = 0;
    }
  } else {
    if (1 > idx) {
      i = 0;
    } else {
      i = idx;
    }
    iv[0] = 1;
    iv[1] = i;
    d_st.site = &ic_emlrtRSI;
    indexShapeCheck(&d_st, ii->size[0], iv);
    loop_ub = ii->size[0];
    ii->size[0] = i;
    emxEnsureCapacity_int32_T(&c_st, ii, loop_ub, &hb_emlrtRTEI);
  }
  emxInit_uint32_T(&c_st, &idx_te, 1, &ib_emlrtRTEI, true);
  i = idx_te->size[0];
  idx_te->size[0] = ii->size[0];
  emxEnsureCapacity_uint32_T(&st, idx_te, i, &ib_emlrtRTEI);
  loop_ub = ii->size[0];
  for (i = 0; i < loop_ub; i++) {
    idx_te->data[i] = (uint32_T)ii->data[i];
  }
  emxFree_int32_T(&ii);
  i = TERings->size[0] * TERings->size[1] * TERings->size[2];
  TERings->size[0] = 4;
  TERings->size[1] = 3;
  TERings->size[2] = idx_te->size[0];
  emxEnsureCapacity_real_T(sp, TERings, i, &jb_emlrtRTEI);
  loop_ub = 12 * idx_te->size[0];
  for (i = 0; i < loop_ub; i++) {
    TERings->data[i] = 0.0;
  }
  emxInit_uint32_T(sp, &y, 2, &ob_emlrtRTEI, true);
  if (idx_te->size[0] < 1) {
    y->size[0] = 1;
    y->size[1] = 0;
  } else {
    i = y->size[0] * y->size[1];
    y->size[0] = 1;
    y->size[1] = idx_te->size[0];
    emxEnsureCapacity_uint32_T(sp, y, i, &kb_emlrtRTEI);
    loop_ub = idx_te->size[0] - 1;
    for (i = 0; i <= loop_ub; i++) {
      y->data[i] = i + 1U;
    }
  }
  emxInit_uint32_T(sp, &varargin_1, 1, &lb_emlrtRTEI, true);
  st.site = &cb_emlrtRSI;
  i = varargin_1->size[0];
  varargin_1->size[0] = y->size[1];
  emxEnsureCapacity_uint32_T(&st, varargin_1, i, &lb_emlrtRTEI);
  loop_ub = y->size[1];
  for (i = 0; i < loop_ub; i++) {
    varargin_1->data[i] = y->data[i];
  }
  emxFree_uint32_T(&y);
  b_st.site = &kc_emlrtRSI;
  c_st.site = &j_emlrtRSI;
  if (idx_te->size[0] != varargin_1->size[0]) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  i = TEidx->size[0] * TEidx->size[1];
  TEidx->size[0] = varargin_1->size[0];
  TEidx->size[1] = 2;
  emxEnsureCapacity_real_T(&b_st, TEidx, i, &mb_emlrtRTEI);
  loop_ub = varargin_1->size[0];
  for (i = 0; i < loop_ub; i++) {
    TEidx->data[i] = varargin_1->data[i];
  }
  emxFree_uint32_T(&varargin_1);
  loop_ub = idx_te->size[0];
  for (i = 0; i < loop_ub; i++) {
    TEidx->data[i + TEidx->size[0]] = idx_te->data[i];
  }
  if (1 > panels->size[2]) {
    emlrtDynamicBoundsCheckR2012b(1, 1, panels->size[2], &bb_emlrtBCI,
                                  (emlrtCTX)sp);
  }
  AD_idx_1 = panels->data[3] - panels->data[0];
  AD_idx_1 /= muDoubleScalarAbs(AD_idx_1);
  i = idx_te->size[0];
  for (b_i = 0; b_i < i; b_i++) {
    if (b_i + 1 > idx_te->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, idx_te->size[0], &nb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    loop_ub = (int32_T)idx_te->data[b_i];
    if (loop_ub > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, Rings->size[2], &ab_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > TERings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, TERings->size[2], &u_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    nx = (int32_T)idx_te->data[b_i] - 1;
    AD_idx_2 = Rings->data[12 * nx + 3];
    TERings->data[12 * b_i] = AD_idx_2;
    BC_idx_0 = Rings->data[12 * nx + 7];
    TERings->data[12 * b_i + 4] = BC_idx_0;
    BC_idx_1 = Rings->data[12 * nx + 11];
    TERings->data[12 * b_i + 8] = BC_idx_1;
    if (b_i + 1 > idx_te->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, idx_te->size[0], &ob_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    loop_ub = (int32_T)idx_te->data[b_i];
    if (loop_ub > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, Rings->size[2], &y_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > TERings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, TERings->size[2], &t_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    BC_idx_2 = Rings->data[12 * nx + 2];
    TERings->data[12 * b_i + 1] = BC_idx_2;
    AD_idx_0 = 20.0 * AD_idx_1;
    TERings_tmp = Rings->data[12 * nx + 6];
    TERings->data[12 * b_i + 5] = TERings_tmp;
    AD_idx_1_tmp = 0.0 * AD_idx_1;
    b_TERings_tmp = Rings->data[12 * nx + 10];
    TERings->data[12 * b_i + 9] = b_TERings_tmp;
    if (b_i + 1 > idx_te->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, idx_te->size[0], &pb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    loop_ub = (int32_T)idx_te->data[b_i];
    if (loop_ub > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, Rings->size[2], &x_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > TERings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, TERings->size[2], &s_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    TERings->data[12 * b_i + 2] = BC_idx_2 + AD_idx_0;
    TERings->data[12 * b_i + 6] = TERings_tmp + AD_idx_1_tmp;
    TERings->data[12 * b_i + 10] = b_TERings_tmp + AD_idx_1_tmp;
    if (b_i + 1 > idx_te->size[0]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, idx_te->size[0], &qb_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    loop_ub = (int32_T)idx_te->data[b_i];
    if (loop_ub > Rings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(loop_ub, 1, Rings->size[2], &w_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (b_i + 1 > TERings->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_i + 1, 1, TERings->size[2], &r_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    TERings->data[12 * b_i + 3] = AD_idx_2 + AD_idx_0;
    TERings->data[12 * b_i + 7] = BC_idx_0 + AD_idx_1_tmp;
    TERings->data[12 * b_i + 11] = BC_idx_1 + AD_idx_1_tmp;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  emxFree_uint32_T(&idx_te);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (generate_rings.c) */
