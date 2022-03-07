/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * vortex_line.c
 *
 * Code generation for function 'vortex_line'
 *
 */

/* Include files */
#include "vortex_line.h"
#include "rt_nonfinite.h"
#include "vlm_C_code_data.h"
#include "mwmathutil.h"

/* Function Definitions */
void vortex_line(const emlrtStack *sp, const real_T p1[3], const real_T p2[3],
                 const real_T p_i[3], real_T b_gamma, real_T eta, real_T q[3])
{
  emlrtStack st;
  real_T K_tmp;
  real_T a;
  real_T b_a;
  real_T b_q_tmp;
  real_T c_q_tmp;
  real_T d_q_tmp;
  real_T e_q_tmp;
  real_T f_q_tmp;
  real_T q_tmp;
  real_T r1;
  real_T r1cr2_sq;
  real_T r2;
  boolean_T guard1 = false;
  st.prev = sp;
  st.tls = sp->tls;
  /* VORTEX_LINE calculates the induced velocity at point p from a vortex line
   */
  /* between p1 and p2 with strenth gamma (right hand rule from p1 -> p2) */
  /*  get cross product of r1 and r2 */
  q_tmp = p_i[2] - p2[2];
  b_q_tmp = p_i[2] - p1[2];
  c_q_tmp = p_i[1] - p2[1];
  d_q_tmp = p_i[1] - p1[1];
  q[0] = d_q_tmp * q_tmp - b_q_tmp * c_q_tmp;
  e_q_tmp = p_i[0] - p1[0];
  f_q_tmp = p_i[0] - p2[0];
  q[1] = -e_q_tmp * q_tmp + b_q_tmp * f_q_tmp;
  q[2] = e_q_tmp * c_q_tmp - d_q_tmp * f_q_tmp;
  /*  get square of norm of cross product */
  r1cr2_sq = (q[0] * q[0] + q[1] * q[1]) + q[2] * q[2];
  /*  get r1 and r2 distances */
  r2 = p1[0] - p_i[0];
  a = p1[1] - p_i[1];
  b_a = p1[2] - p_i[2];
  st.site = &u_emlrtRSI;
  r1 = (r2 * r2 + a * a) + b_a * b_a;
  if (r1 < 0.0) {
    emlrtErrorWithMessageIdR2018a(
        &st, &i_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
        "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
  }
  r1 = muDoubleScalarSqrt(r1);
  r2 = p2[0] - p_i[0];
  a = p2[1] - p_i[1];
  b_a = p2[2] - p_i[2];
  st.site = &v_emlrtRSI;
  r2 = (r2 * r2 + a * a) + b_a * b_a;
  if (r2 < 0.0) {
    emlrtErrorWithMessageIdR2018a(
        &st, &i_emlrtRTEI, "Coder:toolbox:ElFunDomainError",
        "Coder:toolbox:ElFunDomainError", 3, 4, 4, "sqrt");
  }
  r2 = muDoubleScalarSqrt(r2);
  /*  check not too close to vortex */
  guard1 = false;
  if ((r1 < eta) || (r2 < eta)) {
    guard1 = true;
  } else if (r1cr2_sq < eta * eta) {
    guard1 = true;
  } else {
    /*  get dot product r_0.r_1 and r_0.r_2 */
    /* get induced Velocity */
    a = p2[0] - p1[0];
    b_a = p2[1] - p1[1];
    K_tmp = p2[2] - p1[2];
    r2 = b_gamma / (12.566370614359172 * r1cr2_sq) *
         (((a * e_q_tmp + b_a * d_q_tmp) + K_tmp * b_q_tmp) / r1 -
          ((a * f_q_tmp + b_a * c_q_tmp) + K_tmp * q_tmp) / r2);
    q[0] *= r2;
    q[1] *= r2;
    q[2] *= r2;
  }
  if (guard1) {
    q[0] = 0.0;
    q[1] = 0.0;
    q[2] = 0.0;
  }
}

/* End of code generation (vortex_line.c) */
