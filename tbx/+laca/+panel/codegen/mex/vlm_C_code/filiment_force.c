/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * filiment_force.c
 *
 * Code generation for function 'filiment_force'
 *
 */

/* Include files */
#include "filiment_force.h"
#include "cross.h"
#include "repmat.h"
#include "rt_nonfinite.h"
#include "sum.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_emxutil.h"
#include "vlm_C_code_types.h"
#include "mwmathutil.h"

/* Variable Definitions */
static emlrtRSInfo
    emlrtRSI =
        {
            4,                /* lineNo */
            "filiment_force", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pathName */
};

static emlrtRSInfo
    b_emlrtRSI =
        {
            5,                /* lineNo */
            "filiment_force", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pathName */
};

static emlrtRSInfo
    c_emlrtRSI =
        {
            6,                /* lineNo */
            "filiment_force", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pathName */
};

static emlrtRSInfo
    d_emlrtRSI =
        {
            7,                /* lineNo */
            "filiment_force", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pathName */
};

static emlrtRSInfo
    e_emlrtRSI =
        {
            14,               /* lineNo */
            "filiment_force", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pathName */
};

static emlrtRSInfo
    f_emlrtRSI =
        {
            15,               /* lineNo */
            "filiment_force", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pathName */
};

static emlrtRSInfo
    g_emlrtRSI =
        {
            27,               /* lineNo */
            "filiment_force", /* fcnName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pathName */
};

static emlrtRSInfo i_emlrtRSI = {
    24,    /* lineNo */
    "cat", /* fcnName */
    "C:\\Program "
    "Files\\MATLAB\\R2021a\\toolbox\\eml\\eml\\+coder\\+internal\\cat.m" /* pathName
                                                                          */
};

static emlrtECInfo
    emlrtECI =
        {
            2,                /* nDims */
            9,                /* lineNo */
            6,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtECInfo
    b_emlrtECI =
        {
            2,                /* nDims */
            10,               /* lineNo */
            6,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtECInfo
    c_emlrtECI =
        {
            2,                /* nDims */
            11,               /* lineNo */
            6,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtECInfo
    d_emlrtECI =
        {
            2,                /* nDims */
            12,               /* lineNo */
            6,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtECInfo
    e_emlrtECI =
        {
            2,                /* nDims */
            27,               /* lineNo */
            9,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtDCInfo
    emlrtDCI =
        {
            17,               /* lineNo */
            19,               /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            1          /* checkKind */
};

static emlrtDCInfo
    b_emlrtDCI =
        {
            17,               /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            1          /* checkKind */
};

static emlrtBCInfo
    emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            19,               /* lineNo */
            1,                /* colNo */
            "connectivity",   /* aName */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    b_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            32,               /* lineNo */
            4,                /* colNo */
            "F",              /* aName */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    c_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            32,               /* lineNo */
            25,               /* colNo */
            "F_fil",          /* aName */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    d_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            23,               /* lineNo */
            8,                /* colNo */
            "f_gamma",        /* aName */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    e_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            23,               /* lineNo */
            25,               /* colNo */
            "gamma",          /* aName */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            0          /* checkKind */
};

static emlrtBCInfo
    f_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            23,               /* lineNo */
            38,               /* colNo */
            "gamma",          /* aName */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            0          /* checkKind */
};

static emlrtDCInfo
    c_emlrtDCI =
        {
            23,               /* lineNo */
            38,               /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            1          /* checkKind */
};

static emlrtBCInfo
    g_emlrtBCI =
        {
            -1,               /* iFirst */
            -1,               /* iLast */
            23,               /* lineNo */
            38,               /* colNo */
            "connectivity",   /* aName */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m", /* pName */
            0          /* checkKind */
};

static emlrtRTEInfo
    m_emlrtRTEI =
        {
            9,                /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    n_emlrtRTEI =
        {
            10,               /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    o_emlrtRTEI =
        {
            11,               /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    p_emlrtRTEI =
        {
            12,               /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    q_emlrtRTEI =
        {
            14,               /* lineNo */
            15,               /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    r_emlrtRTEI =
        {
            15,               /* lineNo */
            13,               /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    s_emlrtRTEI =
        {
            17,               /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    t_emlrtRTEI =
        {
            18,               /* lineNo */
            9,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    u_emlrtRTEI =
        {
            18,               /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    v_emlrtRTEI =
        {
            19,               /* lineNo */
            14,               /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    w_emlrtRTEI =
        {
            1,                /* lineNo */
            14,               /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    x_emlrtRTEI =
        {
            27,               /* lineNo */
            9,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    y_emlrtRTEI =
        {
            27,               /* lineNo */
            1,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

static emlrtRTEInfo
    ab_emlrtRTEI =
        {
            29,               /* lineNo */
            5,                /* colNo */
            "filiment_force", /* fName */
            "C:\\Git\\AlbatrossOneNastran\\matlab\\+laca\\+panel\\filiment_"
            "force.m" /* pName */
};

/* Function Definitions */
void filiment_force(const emlrtStack *sp, const emxArray_real_T *rings,
                    const emxArray_real_T *V, emxArray_real_T *connectivity,
                    emxArray_real_T *b_gamma, real_T rho, emxArray_real_T *F)
{
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack st;
  emxArray_boolean_T *r3;
  emxArray_int32_T *r4;
  emxArray_real_T r5;
  emxArray_real_T r6;
  emxArray_real_T *AB;
  emxArray_real_T *BC;
  emxArray_real_T *CD;
  emxArray_real_T *DA;
  emxArray_real_T *f_gamma;
  emxArray_real_T *r;
  emxArray_real_T *r1;
  emxArray_real_T *r2;
  real_T b_BC[12];
  real_T d;
  real_T idx;
  int32_T b_input_sizes[2];
  int32_T c_input_sizes[2];
  int32_T d_input_sizes[2];
  int32_T input_sizes[2];
  int32_T b_calclen;
  int32_T c_calclen;
  int32_T calclen;
  int32_T d_calclen;
  int32_T i;
  int32_T i1;
  int32_T maxdimlen;
  int32_T nx;
  int8_T b_input_sizes_idx_0;
  int8_T c_input_sizes_idx_0;
  int8_T input_sizes_idx_0;
  int8_T sizes_idx_0;
  boolean_T empty_non_axis_sizes;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b((emlrtCTX)sp);
  st.site = &emlrtRSI;
  nx = 3 * rings->size[2];
  b_st.site = &h_emlrtRSI;
  calclen = nx / 3;
  if (calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  maxdimlen = 3;
  if (rings->size[2] > 3) {
    maxdimlen = rings->size[2];
  }
  if (calclen > muIntScalarMax_sint32(nx, maxdimlen)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  st.site = &b_emlrtRSI;
  nx = 3 * rings->size[2];
  b_st.site = &h_emlrtRSI;
  b_calclen = nx / 3;
  if (b_calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  maxdimlen = 3;
  if (rings->size[2] > 3) {
    maxdimlen = rings->size[2];
  }
  if (b_calclen > muIntScalarMax_sint32(nx, maxdimlen)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * b_calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  st.site = &c_emlrtRSI;
  nx = 3 * rings->size[2];
  b_st.site = &h_emlrtRSI;
  c_calclen = nx / 3;
  if (c_calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  maxdimlen = 3;
  if (rings->size[2] > 3) {
    maxdimlen = rings->size[2];
  }
  if (c_calclen > muIntScalarMax_sint32(nx, maxdimlen)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * c_calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  st.site = &d_emlrtRSI;
  nx = 3 * rings->size[2];
  b_st.site = &h_emlrtRSI;
  d_calclen = nx / 3;
  if (d_calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  maxdimlen = 3;
  if (rings->size[2] > 3) {
    maxdimlen = rings->size[2];
  }
  if (d_calclen > muIntScalarMax_sint32(nx, maxdimlen)) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * d_calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  input_sizes[0] = 3;
  input_sizes[1] = b_calclen;
  b_input_sizes[0] = 3;
  b_input_sizes[1] = calclen;
  if (b_calclen != calclen) {
    emlrtSizeEqCheckNDR2012b(&input_sizes[0], &b_input_sizes[0], &emlrtECI,
                             (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &AB, 2, &m_emlrtRTEI, true);
  i = AB->size[0] * AB->size[1];
  AB->size[0] = 3;
  AB->size[1] = b_calclen;
  emxEnsureCapacity_real_T(sp, AB, i, &m_emlrtRTEI);
  for (i = 0; i < b_calclen; i++) {
    AB->data[3 * i] = rings->data[12 * i + 1] - rings->data[12 * i];
    AB->data[3 * i + 1] = rings->data[12 * i + 5] - rings->data[12 * i + 4];
    AB->data[3 * i + 2] = rings->data[12 * i + 9] - rings->data[12 * i + 8];
  }
  input_sizes[0] = 3;
  input_sizes[1] = c_calclen;
  b_input_sizes[0] = 3;
  b_input_sizes[1] = b_calclen;
  if (c_calclen != b_calclen) {
    emlrtSizeEqCheckNDR2012b(&input_sizes[0], &b_input_sizes[0], &b_emlrtECI,
                             (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &BC, 2, &n_emlrtRTEI, true);
  i = BC->size[0] * BC->size[1];
  BC->size[0] = 3;
  BC->size[1] = c_calclen;
  emxEnsureCapacity_real_T(sp, BC, i, &n_emlrtRTEI);
  for (i = 0; i < c_calclen; i++) {
    BC->data[3 * i] = rings->data[12 * i + 2] - rings->data[12 * i + 1];
    BC->data[3 * i + 1] = rings->data[12 * i + 6] - rings->data[12 * i + 5];
    BC->data[3 * i + 2] = rings->data[12 * i + 10] - rings->data[12 * i + 9];
  }
  input_sizes[0] = 3;
  input_sizes[1] = d_calclen;
  b_input_sizes[0] = 3;
  b_input_sizes[1] = c_calclen;
  if (d_calclen != c_calclen) {
    emlrtSizeEqCheckNDR2012b(&input_sizes[0], &b_input_sizes[0], &c_emlrtECI,
                             (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &CD, 2, &o_emlrtRTEI, true);
  i = CD->size[0] * CD->size[1];
  CD->size[0] = 3;
  CD->size[1] = d_calclen;
  emxEnsureCapacity_real_T(sp, CD, i, &o_emlrtRTEI);
  for (i = 0; i < d_calclen; i++) {
    CD->data[3 * i] = rings->data[12 * i + 3] - rings->data[12 * i + 2];
    CD->data[3 * i + 1] = rings->data[12 * i + 7] - rings->data[12 * i + 6];
    CD->data[3 * i + 2] = rings->data[12 * i + 11] - rings->data[12 * i + 10];
  }
  input_sizes[0] = 3;
  input_sizes[1] = calclen;
  b_input_sizes[0] = 3;
  b_input_sizes[1] = d_calclen;
  if (calclen != d_calclen) {
    emlrtSizeEqCheckNDR2012b(&input_sizes[0], &b_input_sizes[0], &d_emlrtECI,
                             (emlrtCTX)sp);
  }
  emxInit_real_T(sp, &DA, 2, &p_emlrtRTEI, true);
  i = DA->size[0] * DA->size[1];
  DA->size[0] = 3;
  DA->size[1] = calclen;
  emxEnsureCapacity_real_T(sp, DA, i, &p_emlrtRTEI);
  for (i = 0; i < calclen; i++) {
    DA->data[3 * i] = rings->data[12 * i] - rings->data[12 * i + 3];
    DA->data[3 * i + 1] = rings->data[12 * i + 4] - rings->data[12 * i + 7];
    DA->data[3 * i + 2] = rings->data[12 * i + 8] - rings->data[12 * i + 11];
  }
  st.site = &e_emlrtRSI;
  b_st.site = &i_emlrtRSI;
  if (AB->size[1] != 0) {
    maxdimlen = AB->size[1];
  } else if (BC->size[1] != 0) {
    maxdimlen = BC->size[1];
  } else if (CD->size[1] != 0) {
    maxdimlen = CD->size[1];
  } else if (DA->size[1] != 0) {
    maxdimlen = DA->size[1];
  } else {
    maxdimlen = 0;
  }
  c_st.site = &j_emlrtRSI;
  if ((AB->size[1] != maxdimlen) && (AB->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  if ((BC->size[1] != maxdimlen) && (BC->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  if ((CD->size[1] != maxdimlen) && (CD->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  if ((DA->size[1] != maxdimlen) && (DA->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  empty_non_axis_sizes = (maxdimlen == 0);
  if (empty_non_axis_sizes || (AB->size[1] != 0)) {
    input_sizes_idx_0 = 3;
  } else {
    input_sizes_idx_0 = 0;
  }
  if (empty_non_axis_sizes || (BC->size[1] != 0)) {
    b_input_sizes_idx_0 = 3;
  } else {
    b_input_sizes_idx_0 = 0;
  }
  if (empty_non_axis_sizes || (CD->size[1] != 0)) {
    c_input_sizes_idx_0 = 3;
  } else {
    c_input_sizes_idx_0 = 0;
  }
  if (empty_non_axis_sizes || (DA->size[1] != 0)) {
    sizes_idx_0 = 3;
  } else {
    sizes_idx_0 = 0;
  }
  emxInit_real_T(&b_st, &r, 2, &w_emlrtRTEI, true);
  c_calclen = c_input_sizes_idx_0;
  i = ((input_sizes_idx_0 + b_input_sizes_idx_0) + c_input_sizes_idx_0) +
      sizes_idx_0;
  i1 = r->size[0] * r->size[1];
  r->size[0] = i;
  r->size[1] = maxdimlen;
  emxEnsureCapacity_real_T(sp, r, i1, &q_emlrtRTEI);
  for (i1 = 0; i1 < maxdimlen; i1++) {
    d_calclen = input_sizes_idx_0;
    for (nx = 0; nx < d_calclen; nx++) {
      r->data[nx + r->size[0] * i1] = AB->data[nx + 3 * i1];
    }
  }
  for (i1 = 0; i1 < maxdimlen; i1++) {
    d_calclen = b_input_sizes_idx_0;
    for (nx = 0; nx < d_calclen; nx++) {
      r->data[(nx + input_sizes_idx_0) + r->size[0] * i1] =
          BC->data[nx + 3 * i1];
    }
  }
  for (i1 = 0; i1 < maxdimlen; i1++) {
    for (nx = 0; nx < c_calclen; nx++) {
      r->data[((nx + input_sizes_idx_0) + b_input_sizes_idx_0) +
              r->size[0] * i1] = CD->data[nx + 3 * i1];
    }
  }
  emxFree_real_T(&CD);
  for (i1 = 0; i1 < maxdimlen; i1++) {
    d_calclen = sizes_idx_0;
    for (nx = 0; nx < d_calclen; nx++) {
      r->data[(((nx + input_sizes_idx_0) + b_input_sizes_idx_0) +
               c_input_sizes_idx_0) +
              r->size[0] * i1] = DA->data[nx + 3 * i1];
    }
  }
  emxFree_real_T(&DA);
  st.site = &e_emlrtRSI;
  nx = r->size[0] * r->size[1];
  b_st.site = &h_emlrtRSI;
  calclen = nx / 3;
  if (calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  maxdimlen = r->size[0];
  if (r->size[1] > i) {
    maxdimlen = r->size[1];
  }
  maxdimlen = muIntScalarMax_sint32(nx, maxdimlen);
  if (3 > maxdimlen) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (calclen > maxdimlen) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  st.site = &f_emlrtRSI;
  b_st.site = &i_emlrtRSI;
  if (V->size[1] != 0) {
    maxdimlen = V->size[1];
  } else {
    maxdimlen = 0;
  }
  c_st.site = &j_emlrtRSI;
  if ((V->size[1] != maxdimlen) && (V->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  if ((V->size[1] != maxdimlen) && (V->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  if ((V->size[1] != maxdimlen) && (V->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  if ((V->size[1] != maxdimlen) && (V->size[1] != 0)) {
    emlrtErrorWithMessageIdR2018a(&c_st, &c_emlrtRTEI,
                                  "MATLAB:catenate:matrixDimensionMismatch",
                                  "MATLAB:catenate:matrixDimensionMismatch", 0);
  }
  empty_non_axis_sizes = (maxdimlen == 0);
  if (empty_non_axis_sizes || (V->size[1] != 0)) {
    input_sizes_idx_0 = 3;
  } else {
    input_sizes_idx_0 = 0;
  }
  if (empty_non_axis_sizes || (V->size[1] != 0)) {
    b_input_sizes_idx_0 = 3;
  } else {
    b_input_sizes_idx_0 = 0;
  }
  if (empty_non_axis_sizes || (V->size[1] != 0)) {
    c_input_sizes_idx_0 = 3;
  } else {
    c_input_sizes_idx_0 = 0;
  }
  if (empty_non_axis_sizes || (V->size[1] != 0)) {
    sizes_idx_0 = 3;
  } else {
    sizes_idx_0 = 0;
  }
  emxInit_real_T(&b_st, &r1, 2, &w_emlrtRTEI, true);
  c_calclen = c_input_sizes_idx_0;
  i = r1->size[0] * r1->size[1];
  r1->size[0] =
      ((input_sizes_idx_0 + b_input_sizes_idx_0) + c_input_sizes_idx_0) +
      sizes_idx_0;
  r1->size[1] = maxdimlen;
  emxEnsureCapacity_real_T(&b_st, r1, i, &r_emlrtRTEI);
  for (i = 0; i < maxdimlen; i++) {
    d_calclen = input_sizes_idx_0;
    for (i1 = 0; i1 < d_calclen; i1++) {
      r1->data[i1 + r1->size[0] * i] = V->data[i1 + 3 * i];
    }
  }
  for (i = 0; i < maxdimlen; i++) {
    d_calclen = b_input_sizes_idx_0;
    for (i1 = 0; i1 < d_calclen; i1++) {
      r1->data[(i1 + input_sizes_idx_0) + r1->size[0] * i] =
          V->data[i1 + 3 * i];
    }
  }
  for (i = 0; i < maxdimlen; i++) {
    for (i1 = 0; i1 < c_calclen; i1++) {
      r1->data[((i1 + input_sizes_idx_0) + b_input_sizes_idx_0) +
               r1->size[0] * i] = V->data[i1 + 3 * i];
    }
  }
  for (i = 0; i < maxdimlen; i++) {
    d_calclen = sizes_idx_0;
    for (i1 = 0; i1 < d_calclen; i1++) {
      r1->data[(((i1 + input_sizes_idx_0) + b_input_sizes_idx_0) +
                c_input_sizes_idx_0) +
               r1->size[0] * i] = V->data[i1 + 3 * i];
    }
  }
  st.site = &f_emlrtRSI;
  nx = r1->size[0] * r1->size[1];
  b_st.site = &h_emlrtRSI;
  b_calclen = nx / 3;
  if (b_calclen > nx) {
    emlrtErrorWithMessageIdR2018a(&b_st, &d_emlrtRTEI,
                                  "Coder:builtins:AssertionFailed",
                                  "Coder:builtins:AssertionFailed", 0);
  }
  maxdimlen = r1->size[0];
  if (r1->size[1] > r1->size[0]) {
    maxdimlen = r1->size[1];
  }
  maxdimlen = muIntScalarMax_sint32(nx, maxdimlen);
  if (3 > maxdimlen) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (b_calclen > maxdimlen) {
    emlrtErrorWithMessageIdR2018a(&st, &b_emlrtRTEI,
                                  "Coder:toolbox:reshape_emptyReshapeLimit",
                                  "Coder:toolbox:reshape_emptyReshapeLimit", 0);
  }
  if (3 * b_calclen != nx) {
    emlrtErrorWithMessageIdR2018a(
        &st, &emlrtRTEI, "Coder:MATLAB:getReshapeDims_notSameNumel",
        "Coder:MATLAB:getReshapeDims_notSameNumel", 0);
  }
  emxInit_real_T(&st, &f_gamma, 2, &s_emlrtRTEI, true);
  i = f_gamma->size[0] * f_gamma->size[1];
  f_gamma->size[0] = 1;
  emxEnsureCapacity_real_T(sp, f_gamma, i, &s_emlrtRTEI);
  d = (real_T)rings->size[2] * 4.0;
  if (d != (int32_T)d) {
    emlrtIntegerCheckR2012b(d, &emlrtDCI, (emlrtCTX)sp);
  }
  i = f_gamma->size[0] * f_gamma->size[1];
  f_gamma->size[1] = (int32_T)d;
  emxEnsureCapacity_real_T(sp, f_gamma, i, &s_emlrtRTEI);
  d = (real_T)rings->size[2] * 4.0;
  if (d != (int32_T)d) {
    emlrtIntegerCheckR2012b(d, &b_emlrtDCI, (emlrtCTX)sp);
  }
  d_calclen = (int32_T)d;
  for (i = 0; i < d_calclen; i++) {
    f_gamma->data[i] = 0.0;
  }
  emxInit_real_T(sp, &r2, 1, &t_emlrtRTEI, true);
  i = r2->size[0];
  r2->size[0] = b_gamma->size[0] + 1;
  emxEnsureCapacity_real_T(sp, r2, i, &t_emlrtRTEI);
  r2->data[0] = 0.0;
  d_calclen = b_gamma->size[0];
  for (i = 0; i < d_calclen; i++) {
    r2->data[i + 1] = b_gamma->data[i];
  }
  i = b_gamma->size[0];
  b_gamma->size[0] = r2->size[0];
  emxEnsureCapacity_real_T(sp, b_gamma, i, &u_emlrtRTEI);
  d_calclen = r2->size[0];
  for (i = 0; i < d_calclen; i++) {
    b_gamma->data[i] = r2->data[i];
  }
  emxFree_real_T(&r2);
  emxInit_boolean_T(sp, &r3, 2, &v_emlrtRTEI, true);
  i = r3->size[0] * r3->size[1];
  r3->size[0] = 4;
  r3->size[1] = connectivity->size[1];
  emxEnsureCapacity_boolean_T(sp, r3, i, &v_emlrtRTEI);
  d_calclen = 4 * connectivity->size[1];
  for (i = 0; i < d_calclen; i++) {
    r3->data[i] = muDoubleScalarIsNaN(connectivity->data[i]);
  }
  c_calclen = (r3->size[1] << 2) - 1;
  maxdimlen = 0;
  for (d_calclen = 0; d_calclen <= c_calclen; d_calclen++) {
    if (r3->data[d_calclen]) {
      maxdimlen++;
    }
  }
  emxInit_int32_T(sp, &r4, 1, &w_emlrtRTEI, true);
  i = r4->size[0];
  r4->size[0] = maxdimlen;
  emxEnsureCapacity_int32_T(sp, r4, i, &w_emlrtRTEI);
  maxdimlen = 0;
  for (d_calclen = 0; d_calclen <= c_calclen; d_calclen++) {
    if (r3->data[d_calclen]) {
      r4->data[maxdimlen] = d_calclen + 1;
      maxdimlen++;
    }
  }
  emxFree_boolean_T(&r3);
  d_calclen = r4->size[0] - 1;
  i = connectivity->size[1] << 2;
  for (i1 = 0; i1 <= d_calclen; i1++) {
    if ((r4->data[i1] < 1) || (r4->data[i1] > i)) {
      emlrtDynamicBoundsCheckR2012b(r4->data[i1], 1, i, &emlrtBCI,
                                    (emlrtCTX)sp);
    }
    connectivity->data[r4->data[i1] - 1] = 0.0;
  }
  emxFree_int32_T(&r4);
  i = rings->size[2];
  for (d_calclen = 0; d_calclen < i; d_calclen++) {
    idx = (((real_T)d_calclen + 1.0) - 1.0) * 4.0;
    if (((int32_T)(idx + 1.0) < 1) ||
        ((int32_T)(idx + 1.0) > f_gamma->size[1])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(idx + 1.0), 1, f_gamma->size[1],
                                    &d_emlrtBCI, (emlrtCTX)sp);
    }
    if (((int32_T)(d_calclen + 2U) < 1) ||
        ((int32_T)(d_calclen + 2U) > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(d_calclen + 2U), 1,
                                    b_gamma->size[0], &e_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (d_calclen + 1 > connectivity->size[1]) {
      emlrtDynamicBoundsCheckR2012b(d_calclen + 1, 1, connectivity->size[1],
                                    &g_emlrtBCI, (emlrtCTX)sp);
    }
    d = connectivity->data[4 * d_calclen] + 1.0;
    if (d != (int32_T)muDoubleScalarFloor(d)) {
      emlrtIntegerCheckR2012b(d, &c_emlrtDCI, (emlrtCTX)sp);
    }
    if (((int32_T)d < 1) || ((int32_T)d > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)d, 1, b_gamma->size[0],
                                    &f_emlrtBCI, (emlrtCTX)sp);
    }
    f_gamma->data[(int32_T)(idx + 1.0) - 1] =
        b_gamma->data[d_calclen + 1] + b_gamma->data[(int32_T)d - 1];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
    if (((int32_T)(idx + 2.0) < 1) ||
        ((int32_T)(idx + 2.0) > f_gamma->size[1])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(idx + 2.0), 1, f_gamma->size[1],
                                    &d_emlrtBCI, (emlrtCTX)sp);
    }
    if (((int32_T)(d_calclen + 2U) < 1) ||
        ((int32_T)(d_calclen + 2U) > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(d_calclen + 2U), 1,
                                    b_gamma->size[0], &e_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (d_calclen + 1 > connectivity->size[1]) {
      emlrtDynamicBoundsCheckR2012b(d_calclen + 1, 1, connectivity->size[1],
                                    &g_emlrtBCI, (emlrtCTX)sp);
    }
    d = connectivity->data[4 * d_calclen + 1] + 1.0;
    if (d != (int32_T)muDoubleScalarFloor(d)) {
      emlrtIntegerCheckR2012b(d, &c_emlrtDCI, (emlrtCTX)sp);
    }
    if (((int32_T)d < 1) || ((int32_T)d > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)d, 1, b_gamma->size[0],
                                    &f_emlrtBCI, (emlrtCTX)sp);
    }
    f_gamma->data[(int32_T)(idx + 2.0) - 1] =
        b_gamma->data[d_calclen + 1] + b_gamma->data[(int32_T)d - 1];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
    if (((int32_T)(idx + 3.0) < 1) ||
        ((int32_T)(idx + 3.0) > f_gamma->size[1])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(idx + 3.0), 1, f_gamma->size[1],
                                    &d_emlrtBCI, (emlrtCTX)sp);
    }
    if (((int32_T)(d_calclen + 2U) < 1) ||
        ((int32_T)(d_calclen + 2U) > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(d_calclen + 2U), 1,
                                    b_gamma->size[0], &e_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (d_calclen + 1 > connectivity->size[1]) {
      emlrtDynamicBoundsCheckR2012b(d_calclen + 1, 1, connectivity->size[1],
                                    &g_emlrtBCI, (emlrtCTX)sp);
    }
    d = connectivity->data[4 * d_calclen + 2] + 1.0;
    if (d != (int32_T)muDoubleScalarFloor(d)) {
      emlrtIntegerCheckR2012b(d, &c_emlrtDCI, (emlrtCTX)sp);
    }
    if (((int32_T)d < 1) || ((int32_T)d > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)d, 1, b_gamma->size[0],
                                    &f_emlrtBCI, (emlrtCTX)sp);
    }
    f_gamma->data[(int32_T)(idx + 3.0) - 1] =
        b_gamma->data[d_calclen + 1] + b_gamma->data[(int32_T)d - 1];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
    if (((int32_T)(idx + 4.0) < 1) ||
        ((int32_T)(idx + 4.0) > f_gamma->size[1])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(idx + 4.0), 1, f_gamma->size[1],
                                    &d_emlrtBCI, (emlrtCTX)sp);
    }
    if (((int32_T)(d_calclen + 2U) < 1) ||
        ((int32_T)(d_calclen + 2U) > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)(d_calclen + 2U), 1,
                                    b_gamma->size[0], &e_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    if (d_calclen + 1 > connectivity->size[1]) {
      emlrtDynamicBoundsCheckR2012b(d_calclen + 1, 1, connectivity->size[1],
                                    &g_emlrtBCI, (emlrtCTX)sp);
    }
    d = connectivity->data[4 * d_calclen + 3] + 1.0;
    if (d != (int32_T)muDoubleScalarFloor(d)) {
      emlrtIntegerCheckR2012b(d, &c_emlrtDCI, (emlrtCTX)sp);
    }
    if (((int32_T)d < 1) || ((int32_T)d > b_gamma->size[0])) {
      emlrtDynamicBoundsCheckR2012b((int32_T)d, 1, b_gamma->size[0],
                                    &f_emlrtBCI, (emlrtCTX)sp);
    }
    f_gamma->data[(int32_T)(idx + 4.0) - 1] =
        b_gamma->data[d_calclen + 1] + b_gamma->data[(int32_T)d - 1];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  r5 = *r1;
  c_input_sizes[0] = 3;
  c_input_sizes[1] = b_calclen;
  r5.size = &c_input_sizes[0];
  r5.numDimensions = 2;
  r6 = *r;
  d_input_sizes[0] = 3;
  d_input_sizes[1] = calclen;
  r6.size = &d_input_sizes[0];
  r6.numDimensions = 2;
  st.site = &g_emlrtRSI;
  cross(&st, &r5, &r6, BC);
  d_calclen = 3 * BC->size[1];
  i = BC->size[0] * BC->size[1];
  BC->size[0] = 3;
  emxEnsureCapacity_real_T(sp, BC, i, &x_emlrtRTEI);
  emxFree_real_T(&r1);
  emxFree_real_T(&r);
  for (i = 0; i < d_calclen; i++) {
    BC->data[i] *= rho;
  }
  st.site = &g_emlrtRSI;
  repmat(&st, f_gamma, AB);
  input_sizes[0] = (*(int32_T(*)[2])BC->size)[0];
  input_sizes[1] = (*(int32_T(*)[2])BC->size)[1];
  b_input_sizes[0] = (*(int32_T(*)[2])AB->size)[0];
  b_input_sizes[1] = (*(int32_T(*)[2])AB->size)[1];
  emlrtSizeEqCheckNDR2012b(&input_sizes[0], &b_input_sizes[0], &e_emlrtECI,
                           (emlrtCTX)sp);
  d_calclen = 3 * BC->size[1];
  i = BC->size[0] * BC->size[1];
  BC->size[0] = 3;
  emxEnsureCapacity_real_T(sp, BC, i, &y_emlrtRTEI);
  emxFree_real_T(&f_gamma);
  for (i = 0; i < d_calclen; i++) {
    BC->data[i] *= AB->data[i];
  }
  emxFree_real_T(&AB);
  i = F->size[0] * F->size[1];
  F->size[0] = 3;
  F->size[1] = rings->size[2];
  emxEnsureCapacity_real_T(sp, F, i, &ab_emlrtRTEI);
  i = rings->size[2];
  for (d_calclen = 0; d_calclen < i; d_calclen++) {
    idx = (((real_T)d_calclen + 1.0) - 1.0) * 4.0 + 1.0;
    for (i1 = 0; i1 < 4; i1++) {
      nx = (int32_T)(idx + (real_T)i1);
      if ((nx < 1) || (nx > BC->size[1])) {
        emlrtDynamicBoundsCheckR2012b(nx, 1, BC->size[1], &c_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      maxdimlen = 3 * (nx - 1);
      b_BC[3 * i1] = BC->data[maxdimlen];
      if (nx > BC->size[1]) {
        emlrtDynamicBoundsCheckR2012b(nx, 1, BC->size[1], &c_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      b_BC[3 * i1 + 1] = BC->data[maxdimlen + 1];
      if (nx > BC->size[1]) {
        emlrtDynamicBoundsCheckR2012b(nx, 1, BC->size[1], &c_emlrtBCI,
                                      (emlrtCTX)sp);
      }
      b_BC[3 * i1 + 2] = BC->data[maxdimlen + 2];
    }
    if (d_calclen + 1 > F->size[1]) {
      emlrtDynamicBoundsCheckR2012b(d_calclen + 1, 1, F->size[1], &b_emlrtBCI,
                                    (emlrtCTX)sp);
    }
    sum(b_BC, *(real_T(*)[3]) & F->data[3 * d_calclen]);
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b((emlrtCTX)sp);
    }
  }
  emxFree_real_T(&BC);
  emlrtHeapReferenceStackLeaveFcnR2012b((emlrtCTX)sp);
}

/* End of code generation (filiment_force.c) */
