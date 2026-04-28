# Laca (Linear Aero-elastic Code Analysis) Framework

Laca is a modular MATLAB framework designed for aircraft aero-structural analysis. It provides tools for geometry definition, aerodynamics (via Vortex Lattice Method), Finite Element modeling, Multi-Body Dynamics, and integration with external solvers like Nastran.

## Project Overview

- **Language:** MATLAB
- **Architecture:** The project is organized into a MATLAB package named `laca`, with specialized sub-packages for different analysis domains.
- **Key Capabilities:**
    - **Aerodynamics:** Implementation of the Vortex Lattice Method (VLM) for calculating lift and moments.
    - **Structural Modeling:** Tools for generating Finite Element (FE) models and interfacing with Nastran.
    - **Dynamics:** Multi-Body Dynamics (MBD) and Reduced Order Modeling (ROM) capabilities.
    - **Aeroelasticity:** Integration of aerodynamic and structural models for aeroelastic analysis.

## Directory Structure

- `tbx/`: Contains the core `+laca` MATLAB package.
- `examples/`: Example scripts demonstrating how to use the framework.
- `tests/`: Test scripts to verify the correctness of various modules.
- `benchmarks/`: Performance and accuracy benchmarks.
- `pathlist.txt`: List of directories that should be added to the MATLAB path.

## Key Modules (+laca package)

- `+model`: Definition of aircraft, wings, wing sections, and points.
- `+vlm`: Vortex Lattice Method implementation, including AIC (Aerodynamic Influence Coefficient) generation and solving.
- `+fe`: Finite Element model generation and management.
- `+nastran`: Interface for generating and reading Nastran files (SOL 101, 103, 144, 145).
- `+mbd`: Multi-Body Dynamics solvers and utilities.
- `+trim`: Trim parameters and flight condition definitions.
- `+rom`: Tools for creating and using Reduced Order Models.

## Building and Running

### Setup
To use the Laca framework, you must add the relevant directories to your MATLAB path.
```matlab
% Add the following to your MATLAB startup script or run manually
addpath(genpath('tbx'));
addpath(genpath('examples'));
```

### Running Tests
Tests are located in the `tests/` directory. You can run them as individual MATLAB scripts.
Example:
```matlab
% Run a basic rectangular wing VLM test
run('tests/RectanglurWingTest.m');
```

### Benchmarks
Performance benchmarks can be found in the `benchmarks/` directory.
Example:
```matlab
run('benchmarks/RectanglurWingWingletBenchmark.m');
```

## Development Conventions

- **Namespace:** All core functionality is within the `laca` package namespace. Use `laca.module.Class` to access components.
- **Class System:** The framework heavily uses MATLAB's Object-Oriented Programming (OOP) features (handle classes).
- **Naming:** Follows a mix of camelCase and snake_case (e.g., `From_laca_model`, `generate_rings`).
- **Documentation:** Most classes and methods have basic MATLAB help comments. Use `help laca.vlm.Model` for information.
