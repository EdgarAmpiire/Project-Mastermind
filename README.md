# 🧠 Mastermind – Ruby Command-Line Game

A command-line version of the classic **Mastermind** game, built with **Ruby** as part of [The Odin Project](https://www.theodinproject.com) curriculum.

You can play as either the **code breaker** (guess the computer’s secret code) or the **code maker** (create your own code and let the computer try to break it using logic).

---

## 🚀 Features

- Play as **code breaker** or **code maker**
- Feedback system for each guess:
  - ⚫ = correct color and correct position
  - ⚪ = correct color but wrong position
- Computer uses a smart elimination strategy when guessing
- 12-turn limit to solve or break the code
- Optional support for colorized terminal output using the `colorize` gem

---

## 🎨 Available Colors

Colors are represented by their initials:
R = Red
G = Green
B = Blue
Y = Yellow
O = Orange
P = Purple


Valid input examples: `RGBY`, `RGRG`, `BBOY`

---

## 🧑‍💻 Installation & Setup

1. **Clone the repository:**

```bash
git clone https://github.com/your-username/mastermind.git
cd mastermind
```

2. **Install bundler dependencies**
```bash
bundle install
```

3. **Run the game**
```bash
./bin/mastermind
```

**Or run with bundler**
```bash
bundle exec ruby ./bin/mastermind
```

## 🧠 Computer Strategy
- When you choose to be the code maker, the computer:

- Starts with a fixed or random guess

- Receives feedback from you (automated in the code)

- Filters all possible combinations based on the feedback

- Continues guessing only from valid candidates until it breaks your code or runs out of turns

## 📦 Built With
- Ruby

- Bundler

- Optional: colorize gem for colorful output


## ✍️ Author
Edgar Ampiire
- Project built with 💡 during The Odin Project Ruby curriculum.
