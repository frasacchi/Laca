/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_vlm_C_code_api.h
 *
 * Code generation for function '_coder_vlm_C_code_api'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void filiment_force_api(const mxArray *const prhs[5], const mxArray **plhs);

void generate_AIC_api(const mxArray *const prhs[5], const mxArray **plhs);

void generate_rings_api(const mxArray *const prhs[2], int32_T nlhs,
                        const mxArray *plhs[5]);

void induced_velocity_api(const mxArray *const prhs[5], const mxArray **plhs);

void panel_normal_api(const mxArray *prhs, const mxArray **plhs);

void vortex_line_api(const mxArray *const prhs[5], const mxArray **plhs);

void vortex_ring_api(const mxArray *const prhs[3], const mxArray **plhs);

/* End of code generation (_coder_vlm_C_code_api.h) */
