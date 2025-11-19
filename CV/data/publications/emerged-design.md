---
title: Emergent Design
author: Alon Yehezkel
date: 2025-11-19
summary: Making Better Decisions With Simplicity, Humility & Reality
---
# Emergent Design
Making Better Decisions With Simplicity, Humility & Reality

## How Do We Make Decisions?

Have you ever noticed how fast you form an opinion about something?
A design idea shows up in a meeting, and within seconds your brain goes:

* *“Yes, this makes sense.”*
* *“No, this won’t work.”*
* *“We should build it ourselves.”*
* *“Let’s use some 3rd party integration.”*

Most of these reactions feel logical.
But they’re not. They’re instincts shaped by our **past experiences**, and they’re full of **biases**.

We trust our first impressions far more than we should — and it affects decision making and architecture eventually.

Before diving into systems, design, and trade-offs, let’s acknowledge the truth:

**We don’t make decisions rationally. We make them emotionally first, then justify them logically.**

And that’s exactly where things go wrong.

---

## **A Quick Introduction**

I’ve spent years building systems, scaling teams, and making architectural decisions under pressure.
Through that journey I realized something counter-intuitive:

**The best architecture is not the one we design upfront —
it’s the one that emerges from reality.**

This discovery led me deep into Emergent Design.

---

# **The Problem: We Are Biased Creatures**

To warm up the room, I often show a list of cognitive biases and ask the audience:

> *“Who knows this one?”*
> *“Who has fallen for that one?”*

It's always fun — and uncomfortable — because everyone recognizes themselves.

Here are some classics we hit daily as engineers:

### **Confirmation Bias**

We notice evidence that supports what we already believe.
*Example:* You prefer building auth in-house, so you read only articles that say “auth isn't that hard” and ignore warnings about security or enterprise SSO needs.

### **Anchoring Bias**

We cling to the first estimate or idea we heard.
*Example:* Someone says “two weeks,” and suddenly every discussion gravitates around that number — even when reality says otherwise.

### **Availability Bias**

We judge decisions based on the examples that come to mind easily, not on actual data.
*Example:* You once had a bad experience with a 3rd-party provider, so you think it’s risky — even if the real risk today is low.

### **Sunk Cost Fallacy**

We stick with failing decisions because we’ve already invested time and resources.
*Example:* You keep pushing a custom solution even though switching to Okta is now smarter — simply because you’ve already spent a month on it.

### **Optimism Bias**

We underestimate risks because we believe things will “just work.”
*Example:* You assume your custom identity solution will scale without issues — despite having zero data to support that confidence.

These biases shape our decisions more than any design pattern or architectural principle ever will.

---

# **A Real Story: Adding User Identity to a System**

Let’s take a real case:
**Adding user identity to a growing product.**

Two separate contexts, two very different decisions.

---

## **Case A: B2C — Simple, Fast, Self-Implemented Authentication**

* Need a branded, tailored user experience
* Minimal business complexity
* Fast development cycles
* Few enterprise expectations
* Small team, tight deadlines

Here, building auth internally is simple, cheap, and effective.
A lightweight implementation works beautifully for a long time.

*Reality beats prediction.*

---

## **Case B: B2B — Okta + SAML Integration**

* Enterprise customers expect SSO
* Compliance, audits, security reviews
* SLA guarantees
* Contractual obligations
* Multi-tenant complexity

Here, building auth internally is a liability.
Okta/SAML integration is the correct path.

*Context beats preference.*

---

# **What Is Emergent Design?**

Emergent Design is the discipline of **letting architecture evolve based on present reality**, instead of predicting the future.

It’s not being “lazy” or “not planning.”
It’s being honest about uncertainty.

Here’s what it really means:

### **1. Simplicity First**

Build the simplest version that works **today**, not the one you imagine you’ll need in 12 months.

### **2. Reality-Driven Decisions**

Make decisions based on visible facts:

* customer needs
* performance metrics
* constraints
* team capacity
* operational incidents

Not based on “what if one day…”

### **3. Reversible Decisions**

Prefer choices you can undo cheaply.
Interfaces, adapters, flags, modular boundaries — all give you the freedom to evolve.

### **4. Bias Awareness**

Because we know our brain is unreliable, we make decisions **consciously**, not automatically.

### **5. Continuous Evolution**

Architecture grows like a living organism —
branching, pruning, shaping itself over time.

---

# **Why Emergent Design Wins**

### **No Premature Commitments**

Most expensive architecture decisions are based on fictional futures.

### **Lower Cost of Change**

Small reversible steps → fewer painful rewrites.

### **Velocity Stays High**

Simplicity makes teams faster.

### **Better Alignment with Reality**

The system reflects *actual needs*, not guesses.

### **More Humility, Less Ego**

Design becomes a team sport, not a fight for whose idea wins.

---

# **Supporting Values**

### **Simplicity**

Start with what works now.
Get data before you predict.

### **Humility**

Be okay saying:

* “I don’t know yet.”
* “Let’s try and then decide.”
* “Your point of view might be better.”

### **Professional Curiosity**

Ask:

* “Is there a simpler way?”
* “Is this reversible?”
* “What signals are we seeing right now?”

---

# **Actionable Takeaways**

### **1. Keep biases visible**

Call out assumptions, expose them, and verify them with facts.
This makes the evolution of design visible and grounded.

### **2. Question “known solutions”**

Just because a pattern exists
doesn’t mean it fits your context.

**Ask for other perspectives.
Challenge defaults.
Re-evaluate old decisions.**

---

# **Final Recommendations**

* Use known patterns when they fit the **present problem**, not future hypotheticals.
* Don’t stick to old decisions just because you made them.
* Keep communication open — the fastest way to catch biases is through feedback.
* Design in small reversible steps, and let the architecture emerge.

---

# **Closing Thought**

**Emergent Design is not about doing less —
it’s about doing the right things at the right time.**

The best architecture is the one that grows with the truth,
not the one built on our biases.

Thanks for reading.
Questions and discussions welcome.
