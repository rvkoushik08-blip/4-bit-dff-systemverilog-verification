# 4-Bit D Flip-Flop Verification using SystemVerilog

## 📌 Project Overview

This project implements and verifies a **4-bit D Flip-Flop** using an **Object-Oriented SystemVerilog testbench**.

The verification environment generates randomized input transactions and checks the DUT output using a scoreboard.

The simulation is performed using **Verilator**.

---

## 🎯 DUT Description

The Design Under Test (DUT) is a 4-bit D Flip-Flop with:

- Clock input
- Synchronous active-high reset
- 4-bit data input
- 4-bit output

### DUT Behavior

| Reset | D | Q |
|-------|---|---|
| 1 | Any value | 0 |
| 0 | 1–15 | D |

The D input is constrained to values from **1 to 15** during randomization.

---

## 🧪 Verification Environment

The testbench is developed using SystemVerilog classes and follows an Object-Oriented verification structure.

```text
                    Test
                     |
                Environment
                     |
        +------------+------------+
        |            |            |
     Generator     Driver      Monitor
        |            |            |
        |         Interface        |
        |            |            |
        |            DUT           |
        |            |            |
        |            |          Monitor
        |            |            |
        +------------+------------+
                     |
                 Scoreboard
                     |
                PASS / FAIL
