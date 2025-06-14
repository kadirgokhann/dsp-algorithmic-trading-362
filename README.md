# Stock Trading Using DSP Techniques

## 📌 Overview

This project simulates the workflow of a quant developer designing a simple stock trading algorithm using **Digital Signal Processing (DSP)** techniques. The main objective is to analyze historical stock price data for four Indian banks and derive meaningful patterns to build an algorithmic trading strategy.

The entire workflow is implemented in **MATLAB**, with focus on signal processing for trend extraction and strategic trading simulations.

---

## 📁 Dataset

- **Stock Source**: 4 CSV files containing daily data from January 1, 2000, to April 30, 2021
- **Focus Column**: VWAP (Volume Weighted Average Price)
- **Stocks**: 4 Indian Banks

---

## 🧠 Part 1: Trend Extraction via DSP (60 Points)

### 1.1 Simple Moving Average (SMA) – *FIR Filter*
- Implemented SMA filter with a chosen window size (e.g., 10, 20, or 50 days)
- Applied separately to each stock
- Plots generated overlaying original vs. SMA-filtered data
- Discussion includes:
  - Effect of window size
  - Delay and smoothing behavior

### 1.2 Exponential Moving Average (EMA) – *IIR Filter*
- Implemented EMA with a specified smoothing factor (α)
- Compared responsiveness with SMA
- Visual and analytical comparison

### 1.3 Custom DSP Method
- Implemented a custom or literature-based DSP method:
  - Options: STFT, Wavelets, Kalman Filter, RSI, MACD, Band-pass filtering, etc.
- Justified the selection
- Provided plots for last 1000 days
- Explained design or literature motivation

---

## 💹 Part 2: Algorithmic Trading Strategy (20 Points)

### Strategy Logic
- Trading simulation over the **last 600 days** of each stock
- Initial balance: **10,000 units** (fractional shares allowed)
- Decisions made *daily* based on DSP signals — no lookahead
- Actions logged in a plain-text format

### Outputs
- Trading log (BUY/SELL actions with timestamp)
- Final net worth
- Commentary on:
  - Strategy logic
  - Performance
  - Improvements

---

## 📊 Report & Visualization (20 Points)

The final report includes:

- Combined plots (last 1000 days) for:
  - Original data (blue)
  - SMA (red)
  - EMA (green)
- Visualizations of custom method
- Plain English or pseudocode description of trading logic
- Performance assessment:
  - Profit/loss
  - Strengths and weaknesses

---

## 🧾 Submission Content

- 📄 `*.m` MATLAB scripts for signal processing and trading
- 📄 `log.txt` - Action log
- 📄 `report.pdf` - Final report with all visualizations and commentary

---

## 🌟 Bonus Ideas (Optional)

For extra exploration (no extra credit):

- Risk management integration
- Strategy comparison to a buy-and-hold baseline
- Inter-stock correlation analysis

---

## 🛠 Tools

- MATLAB R2023 or later (recommended)
- Signal Processing Toolbox (optional)

---

## 📬 Contact

For questions or clarification, please reach out to the course instructors via the university LMS.

---
