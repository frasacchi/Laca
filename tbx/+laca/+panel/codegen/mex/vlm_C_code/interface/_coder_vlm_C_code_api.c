/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_vlm_C_code_api.c
 *
 * Code generation for function '_coder_vlm_C_code_api'
 *
 */

/* Include files */
#include "_coder_vlm_C_code_api.h"
#include "filiment_force.h"
#include "generate_AIC.h"
#include "generate_rings.h"
#include "induced_velocity.h"
#include "panel_normal.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "vlm_C_code_emxutil.h"
#include "vlm_C_code_types.h"
#include "vortex_line.h"
#include "vortex_ring.h"

/* Variable Definitions */
static emlrtRTEInfo kc_emlrtRTEI = {
    1,                       /* lineNo */
    1,                       /* colNo */
    "_coder_vlm_C_code_api", /* fName */
    ""                       /* pName */
};

/* Function Declarations */
static real_T (*ab_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                    const emlrtMsgIdentifier *msgId))[3];

static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u);

static void bb_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                const emlrtMsgIdentifier *msgId,
                                emxArray_real_T *ret);

static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *V,
                               const char_T *identifier, emxArray_real_T *y);

static const mxArray *c_emlrt_marshallOut(const real_T u[3]);

static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static void e_emlrt_marshallIn(const emlrtStack *sp,
                               const mxArray *connectivity,
                               const char_T *identifier, emxArray_real_T *y);

static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *rings,
                             const char_T *identifier, emxArray_real_T *y);

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u);

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *b_gamma,
                               const char_T *identifier, emxArray_real_T *y);

static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static real_T i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *rho,
                                 const char_T *identifier);

static real_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId);

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *te_idx,
                               const char_T *identifier, emxArray_real_T *y);

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *isTE,
                               const char_T *identifier, emxArray_boolean_T *y);

static void n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_boolean_T *y);

static real_T (*o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *point,
                                   const char_T *identifier))[3];

static real_T (*p_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[3];

static void q_emlrt_marshallIn(const emlrtStack *sp, const mxArray *coords,
                               const char_T *identifier, emxArray_real_T *y);

static void r_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y);

static void s_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static void t_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static void u_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static void v_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static real_T w_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static void x_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret);

static void y_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_boolean_T *ret);

/* Function Definitions */
static real_T (*ab_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                    const emlrtMsgIdentifier *msgId))[3]
{
  static const int32_T dims = 3;
  real_T(*ret)[3];
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 1U, (void *)&dims);
  ret = (real_T(*)[3])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  s_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static const mxArray *b_emlrt_marshallOut(const emxArray_real_T *u)
{
  static const int32_T iv[3] = {0, 0, 0};
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateNumericArray(3, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, &u->size[0], 3);
  emlrtAssign(&y, m);
  return y;
}

static void bb_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                const emlrtMsgIdentifier *msgId,
                                emxArray_real_T *ret)
{
  static const int32_T dims[2] = {-1, 3};
  int32_T iv[2];
  int32_T i;
  const boolean_T bv[2] = {true, false};
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 2U, (void *)&dims[0], &bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real_T(sp, ret, i, (emlrtRTEInfo *)NULL);
  ret->data = (real_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *V,
                               const char_T *identifier, emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  d_emlrt_marshallIn(sp, emlrtAlias(V), &thisId, y);
  emlrtDestroyArray(&V);
}

static const mxArray *c_emlrt_marshallOut(const real_T u[3])
{
  static const int32_T i = 0;
  static const int32_T i1 = 3;
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateNumericArray(1, (const void *)&i, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, &i1, 1);
  emlrtAssign(&y, m);
  return y;
}

static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  t_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void e_emlrt_marshallIn(const emlrtStack *sp,
                               const mxArray *connectivity,
                               const char_T *identifier, emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  f_emlrt_marshallIn(sp, emlrtAlias(connectivity), &thisId, y);
  emlrtDestroyArray(&connectivity);
}

static void emlrt_marshallIn(const emlrtStack *sp, const mxArray *rings,
                             const char_T *identifier, emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(sp, emlrtAlias(rings), &thisId, y);
  emlrtDestroyArray(&rings);
}

static const mxArray *emlrt_marshallOut(const emxArray_real_T *u)
{
  static const int32_T iv[2] = {0, 0};
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateNumericArray(2, (const void *)&iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u->data[0]);
  emlrtSetDimensions((mxArray *)m, &u->size[0], 2);
  emlrtAssign(&y, m);
  return y;
}

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  u_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *b_gamma,
                               const char_T *identifier, emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  h_emlrt_marshallIn(sp, emlrtAlias(b_gamma), &thisId, y);
  emlrtDestroyArray(&b_gamma);
}

static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  v_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *rho,
                                 const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = j_emlrt_marshallIn(sp, emlrtAlias(rho), &thisId);
  emlrtDestroyArray(&rho);
  return y;
}

static real_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = w_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *te_idx,
                               const char_T *identifier, emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  l_emlrt_marshallIn(sp, emlrtAlias(te_idx), &thisId, y);
  emlrtDestroyArray(&te_idx);
}

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  x_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *isTE,
                               const char_T *identifier, emxArray_boolean_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  n_emlrt_marshallIn(sp, emlrtAlias(isTE), &thisId, y);
  emlrtDestroyArray(&isTE);
}

static void n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_boolean_T *y)
{
  y_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T (*o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *point,
                                   const char_T *identifier))[3]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[3];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = p_emlrt_marshallIn(sp, emlrtAlias(point), &thisId);
  emlrtDestroyArray(&point);
  return y;
}

static real_T (*p_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[3]
{
  real_T(*y)[3];
  y = ab_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void q_emlrt_marshallIn(const emlrtStack *sp, const mxArray *coords,
                               const char_T *identifier, emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  r_emlrt_marshallIn(sp, emlrtAlias(coords), &thisId, y);
  emlrtDestroyArray(&coords);
}

static void r_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               emxArray_real_T *y)
{
  bb_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void s_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims[3] = {4, 3, -1};
  int32_T iv[3];
  int32_T i;
  const boolean_T bv[3] = {false, false, true};
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 3U, (void *)&dims[0], &bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1] * iv[2];
  i = ret->size[0] * ret->size[1] * ret->size[2];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  ret->size[2] = iv[2];
  emxEnsureCapacity_real_T(sp, ret, i, (emlrtRTEInfo *)NULL);
  ret->data = (real_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void t_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims[2] = {3, -1};
  int32_T iv[2];
  int32_T i;
  const boolean_T bv[2] = {false, true};
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 2U, (void *)&dims[0], &bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real_T(sp, ret, i, (emlrtRTEInfo *)NULL);
  ret->data = (real_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void u_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims[2] = {4, -1};
  int32_T iv[2];
  int32_T i;
  const boolean_T bv[2] = {false, true};
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 2U, (void *)&dims[0], &bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real_T(sp, ret, i, (emlrtRTEInfo *)NULL);
  ret->data = (real_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void v_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims = -1;
  int32_T i;
  int32_T i1;
  const boolean_T b = true;
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 1U, (void *)&dims, &b, &i);
  ret->allocatedSize = i;
  i1 = ret->size[0];
  ret->size[0] = i;
  emxEnsureCapacity_real_T(sp, ret, i1, (emlrtRTEInfo *)NULL);
  ret->data = (real_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static real_T w_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims = 0;
  real_T ret;
  emlrtCheckBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                          false, 0U, (void *)&dims);
  ret = *(real_T *)emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static void x_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_real_T *ret)
{
  static const int32_T dims[2] = {-1, 2};
  int32_T iv[2];
  int32_T i;
  const boolean_T bv[2] = {true, false};
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"double",
                            false, 2U, (void *)&dims[0], &bv[0], &iv[0]);
  ret->allocatedSize = iv[0] * iv[1];
  i = ret->size[0] * ret->size[1];
  ret->size[0] = iv[0];
  ret->size[1] = iv[1];
  emxEnsureCapacity_real_T(sp, ret, i, (emlrtRTEInfo *)NULL);
  ret->data = (real_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void y_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               emxArray_boolean_T *ret)
{
  static const int32_T dims = -1;
  int32_T i;
  int32_T i1;
  const boolean_T b = true;
  emlrtCheckVsBuiltInR2012b((emlrtCTX)sp, msgId, src, (const char_T *)"logical",
                            false, 1U, (void *)&dims, &b, &i);
  ret->allocatedSize = i;
  i1 = ret->size[0];
  ret->size[0] = i;
  emxEnsureCapacity_boolean_T(sp, ret, i1, (emlrtRTEInfo *)NULL);
  ret->data = (boolean_T *)emlrtMxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

void filiment_force_api(const mxArray *const prhs[5], const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_real_T *F;
  emxArray_real_T *V;
  emxArray_real_T *b_gamma;
  emxArray_real_T *connectivity;
  emxArray_real_T *rings;
  const mxArray *prhs_copy_idx_1;
  const mxArray *prhs_copy_idx_2;
  const mxArray *prhs_copy_idx_3;
  real_T rho;
  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_real_T(&st, &rings, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &V, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &connectivity, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &b_gamma, 1, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &F, 2, &kc_emlrtRTEI, true);
  prhs_copy_idx_1 = emlrtProtectR2012b(prhs[1], 1, false, -1);
  prhs_copy_idx_2 = emlrtProtectR2012b(prhs[2], 2, false, -1);
  prhs_copy_idx_3 = emlrtProtectR2012b(prhs[3], 3, false, -1);
  /* Marshall function inputs */
  rings->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "rings", rings);
  V->canFreeData = false;
  c_emlrt_marshallIn(&st, emlrtAlias(prhs_copy_idx_1), "V", V);
  connectivity->canFreeData = false;
  e_emlrt_marshallIn(&st, emlrtAlias(prhs_copy_idx_2), "connectivity",
                     connectivity);
  b_gamma->canFreeData = false;
  g_emlrt_marshallIn(&st, emlrtAlias(prhs_copy_idx_3), "gamma", b_gamma);
  rho = i_emlrt_marshallIn(&st, emlrtAliasP(prhs[4]), "rho");
  /* Invoke the target function */
  filiment_force(&st, rings, V, connectivity, b_gamma, rho, F);
  /* Marshall function outputs */
  F->canFreeData = false;
  *plhs = emlrt_marshallOut(F);
  emxFree_real_T(&F);
  emxFree_real_T(&b_gamma);
  emxFree_real_T(&connectivity);
  emxFree_real_T(&V);
  emxFree_real_T(&rings);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

void generate_AIC_api(const mxArray *const prhs[5], const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_real_T *AIC;
  emxArray_real_T *collocation;
  emxArray_real_T *normal;
  emxArray_real_T *rings;
  emxArray_real_T *te_idx;
  emxArray_real_T *te_rings;
  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_real_T(&st, &rings, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &collocation, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &normal, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &te_rings, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &te_idx, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &AIC, 2, &kc_emlrtRTEI, true);
  /* Marshall function inputs */
  rings->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "rings", rings);
  collocation->canFreeData = false;
  c_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "collocation", collocation);
  normal->canFreeData = false;
  c_emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "normal", normal);
  te_rings->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "te_rings", te_rings);
  te_idx->canFreeData = false;
  k_emlrt_marshallIn(&st, emlrtAlias(prhs[4]), "te_idx", te_idx);
  /* Invoke the target function */
  generate_AIC(&st, rings, collocation, normal, te_rings, te_idx, AIC);
  /* Marshall function outputs */
  AIC->canFreeData = false;
  *plhs = emlrt_marshallOut(AIC);
  emxFree_real_T(&AIC);
  emxFree_real_T(&te_idx);
  emxFree_real_T(&te_rings);
  emxFree_real_T(&normal);
  emxFree_real_T(&collocation);
  emxFree_real_T(&rings);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

void generate_rings_api(const mxArray *const prhs[2], int32_T nlhs,
                        const mxArray *plhs[5])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_boolean_T *isTE;
  emxArray_real_T *Collocation;
  emxArray_real_T *Normal;
  emxArray_real_T *Rings;
  emxArray_real_T *TERings;
  emxArray_real_T *TEidx;
  emxArray_real_T *panels;
  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_real_T(&st, &panels, 3, &kc_emlrtRTEI, true);
  emxInit_boolean_T(&st, &isTE, 1, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &Rings, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &Normal, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &Collocation, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &TERings, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &TEidx, 2, &kc_emlrtRTEI, true);
  /* Marshall function inputs */
  panels->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "panels", panels);
  isTE->canFreeData = false;
  m_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "isTE", isTE);
  /* Invoke the target function */
  generate_rings(&st, panels, isTE, Rings, Normal, Collocation, TERings, TEidx);
  /* Marshall function outputs */
  Rings->canFreeData = false;
  plhs[0] = b_emlrt_marshallOut(Rings);
  emxFree_real_T(&Rings);
  emxFree_boolean_T(&isTE);
  emxFree_real_T(&panels);
  if (nlhs > 1) {
    Normal->canFreeData = false;
    plhs[1] = emlrt_marshallOut(Normal);
  }
  emxFree_real_T(&Normal);
  if (nlhs > 2) {
    Collocation->canFreeData = false;
    plhs[2] = emlrt_marshallOut(Collocation);
  }
  emxFree_real_T(&Collocation);
  if (nlhs > 3) {
    TERings->canFreeData = false;
    plhs[3] = b_emlrt_marshallOut(TERings);
  }
  emxFree_real_T(&TERings);
  if (nlhs > 4) {
    TEidx->canFreeData = false;
    plhs[4] = emlrt_marshallOut(TEidx);
  }
  emxFree_real_T(&TEidx);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

void induced_velocity_api(const mxArray *const prhs[5], const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_real_T *b_gamma;
  emxArray_real_T *rings;
  emxArray_real_T *te_idx;
  emxArray_real_T *te_rings;
  real_T(*V)[3];
  real_T(*point)[3];
  st.tls = emlrtRootTLSGlobal;
  V = (real_T(*)[3])mxMalloc(sizeof(real_T[3]));
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_real_T(&st, &rings, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &te_rings, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &te_idx, 2, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &b_gamma, 1, &kc_emlrtRTEI, true);
  /* Marshall function inputs */
  point = o_emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "point");
  rings->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "rings", rings);
  te_rings->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "te_rings", te_rings);
  te_idx->canFreeData = false;
  k_emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "te_idx", te_idx);
  b_gamma->canFreeData = false;
  g_emlrt_marshallIn(&st, emlrtAlias(prhs[4]), "gamma", b_gamma);
  /* Invoke the target function */
  induced_velocity(&st, *point, rings, te_rings, te_idx, b_gamma, *V);
  /* Marshall function outputs */
  *plhs = c_emlrt_marshallOut(*V);
  emxFree_real_T(&b_gamma);
  emxFree_real_T(&te_idx);
  emxFree_real_T(&te_rings);
  emxFree_real_T(&rings);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

void panel_normal_api(const mxArray *prhs, const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_real_T *Panels;
  emxArray_real_T *out;
  st.tls = emlrtRootTLSGlobal;
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_real_T(&st, &Panels, 3, &kc_emlrtRTEI, true);
  emxInit_real_T(&st, &out, 2, &kc_emlrtRTEI, true);
  /* Marshall function inputs */
  Panels->canFreeData = false;
  emlrt_marshallIn(&st, emlrtAlias(prhs), "Panels", Panels);
  /* Invoke the target function */
  panel_normal(&st, Panels, out);
  /* Marshall function outputs */
  out->canFreeData = false;
  *plhs = emlrt_marshallOut(out);
  emxFree_real_T(&out);
  emxFree_real_T(&Panels);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

void vortex_line_api(const mxArray *const prhs[5], const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  real_T(*p1)[3];
  real_T(*p2)[3];
  real_T(*p_i)[3];
  real_T(*q)[3];
  real_T b_gamma;
  real_T eta;
  st.tls = emlrtRootTLSGlobal;
  q = (real_T(*)[3])mxMalloc(sizeof(real_T[3]));
  /* Marshall function inputs */
  p1 = o_emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "p1");
  p2 = o_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "p2");
  p_i = o_emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "p_i");
  b_gamma = i_emlrt_marshallIn(&st, emlrtAliasP(prhs[3]), "gamma");
  eta = i_emlrt_marshallIn(&st, emlrtAliasP(prhs[4]), "eta");
  /* Invoke the target function */
  vortex_line(&st, *p1, *p2, *p_i, b_gamma, eta, *q);
  /* Marshall function outputs */
  *plhs = c_emlrt_marshallOut(*q);
}

void vortex_ring_api(const mxArray *const prhs[3], const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  emxArray_real_T *coords;
  real_T(*p)[3];
  real_T(*q)[3];
  real_T b_gamma;
  st.tls = emlrtRootTLSGlobal;
  q = (real_T(*)[3])mxMalloc(sizeof(real_T[3]));
  emlrtHeapReferenceStackEnterFcnR2012b(&st);
  emxInit_real_T(&st, &coords, 2, &kc_emlrtRTEI, true);
  /* Marshall function inputs */
  coords->canFreeData = false;
  q_emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "coords", coords);
  p = o_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "p");
  b_gamma = i_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "gamma");
  /* Invoke the target function */
  vortex_ring(&st, coords, *p, b_gamma, *q);
  /* Marshall function outputs */
  *plhs = c_emlrt_marshallOut(*q);
  emxFree_real_T(&coords);
  emlrtHeapReferenceStackLeaveFcnR2012b(&st);
}

/* End of code generation (_coder_vlm_C_code_api.c) */
