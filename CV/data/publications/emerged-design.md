---
title: Emergent Design
author: Alon Yehezkel
date: 2025-11-19
summary: Making Better Decisions With Simplicity, Humility & Reality
---

> **📊 Presentation Slides:** View the full slide deck for this article at [gamma.app/docs/Emergent-Design-z9z8mll2ideik2v](https://gamma.app/docs/Emergent-Design-z9z8mll2ideik2v)

## How Do We Make Decisions?
Before we dive deep into emergent design - what is it and what is it good for, I would like to talk about decision making. Think about your last architectural decision. Did you evaluate every option objectively? Or did your experience whisper "this is how it's done"?

Our minds rely on shortcuts, pattern recognition, gut feelings, and past successes. These shortcuts feel like wisdom, but they're often just biases in disguise.

Daniel Kahneman, in his book *Thinking, Fast and Slow*, describes two systems that drive how we think.

### **🔹 System 1 — Fast, Automatic, Instinctive**
- reacts instantly  
- operates on pattern recognition  
- depends on past experiences  
- makes snap judgments  
- is emotional and unconscious  

Examples:
- Instantly sensing someone’s tone  
- Knowing a shortcut while driving without thinking  
- Feeling that a technical solution “just makes sense”

System 1 is fast — but also **biased**, because it relies on shortcuts and incomplete memories.

---

### **🔹 System 2 — Slow, Analytical, Deliberate**
- reasons logically  
- weighs trade-offs  
- considers alternatives  
- performs deeper analysis  
- requires attention and energy  

Examples:
- Designing system architecture  
- Planning a migration strategy  
- Debugging a complex production issue  
- Evaluating cost, scale, and complexity

System 2 is powerful — but **lazy**. It requires many resources from our brain.

---

We make most of our decision in system 1. Even when we think we're being rational, many decisions happen automatically.

- We hear a suggestion and instantly judge it.  
- We lean toward solutions we used before.  
- We assume difficulty based on a single memory.  
- We trust our gut even when the context is different.  

This is how biases sneak into architecture.

## The Problem: Our Biases Sabotage Our Designs
There are many biases affecting at any given time. These biases lead to over-engineering, premature decisions, and architectural decisions that fight reality instead of embracing it.

Here are the most common biases that quietly shape our technical decisions:

---

### **🌟 Confirmation Bias**
We seek data that confirms what we already believe, ignoring contradictory signals.

**Example:**  
You personally prefer building auth in-house.  
So you notice articles and success stories supporting self-implementation,  
but you downplay customer requirements for enterprise SSO and overlook Okta/SAML integrations that clearly fit the need.

**Result:**  
You reinforce your initial belief instead of evaluating the real context.

---

### **🌟 Anchoring Bias**
We cling to the first number, idea, or suggestion we hear — even when new data should change our mind.

**Example:**  
Someone casually says: “It’s maybe a two-week task.”  
That becomes the anchor.  
Even after discovering compliance steps, SAML configs, and testing needs,  
everything still feels like “it shouldn’t be more than two weeks.”

**Result:**  
Planning becomes distorted by outdated expectations.

---

### **🌟 Sunk Cost Fallacy**
We stick with failing decisions because we’ve already invested time and resources.

**Example:**  
You’ve spent a month building your own authentication layer.  
Halfway through, you realize Okta would solve your use case better.  
But because you already invested weeks, you keep pushing forward.

**Result:**  
You commit even harder to a bad direction.

---

### **🌟 Availability Bias**
We rely on examples that come easily to mind, instead of looking at actual data.

**Example:**  
Years ago, you had a bad experience with a third-party auth provider.  
That memory is vivid, so you assume all such providers are risky.  
Meanwhile, current tools like Okta are stable, mature, and widely used — but that info doesn’t “feel” as real.

**Result:**  
You overestimate old risks and underestimate present realities.

---

### **🌟  Optimism Bias**
We underestimate risks because we believe things will “probably work out.”

**Example:**  
You assume your custom identity solution will scale effortlessly.  
“No worries, auth is simple — it’ll be fine.”  
But you ignore edge cases, security concerns, rate limits, incident history, and future integration needs.

**Result:**  
You commit to a path that looks smooth only because you're discounting the real-world complexity ahead.

## What Is Emergent Design?

Emergent design is an approach to software architecture where the design evolves gradually through continuous feedback, real-world usage, and empirical evidence — rather than being fully planned upfront based on predictions and assumptions.

It's not about having no design. It's about **designing just enough** for what you know today, then letting the architecture emerge and adapt as you learn more.

### Incremental Evolution

Architecture evolves based on real constraints, usage, and continuous learning.

Instead of designing the "final" architecture at the beginning, you:
- Start with the simplest solution that solves the immediate problem
- Observe how the system actually behaves in production
- Identify real bottlenecks, pain points, and usage patterns
- Evolve the architecture based on empirical data, not speculation
- Refactor continuously as your understanding deepens

This is how healthy codebases grow. Through careful, deliberate evolution guided by reality.

### Opposes "Big Design Up Front" (BDUF)

Avoids predicting the future. Designs adapt as reality unfolds.

Traditional architecture often demands:
- Complete requirements upfront (which are always incomplete or wrong)
- Detailed system design before writing code
- Predicting scalability needs years in advance
- Choosing all technologies and patterns at project kickoff

Emergent design rejects this. Why?
- Requirements change as users interact with the product
- You learn what actually matters only after shipping
- Early decisions lock you into paths that may not fit later reality
- Over-engineering for imagined futures wastes time and creates unnecessary complexity

Instead, emergent design makes decisions **just in time** — when you have the most information and the clearest understanding of the actual problem.

### Prioritizes Key Principles

Values facts over predictions, feedback over assumptions, and reversibility over certainty.

Emergent design is guided by core principles:

- **Facts over predictions** - Use real data (metrics, logs, user feedback) rather than guesses about what might happen
- **Feedback over assumptions** — Ship quickly, measure, learn, and adapt rather than assuming you know the right answer
- **Reversibility over certainty** — Make decisions that are easy to reverse rather than trying to make "perfect" irreversible choices
- **Simplicity over speculation** — Solve today's known problems simply, rather than building complex solutions for imagined future scenarios
- **Evidence over ego** — Let the system's behavior guide decisions, not personal preferences or past successes

This mindset shift — from prediction to adaptation — is what enables emergent design to produce better, more maintainable systems.

## Two Identity Systems Use Cases
Same problem, different contexts, different solutions

### **🔹 Case A: B2C Product**
Requirements: Branded experience, custom flows, full control over user journey

Constraints: Small scale, speed to market, minimal dependencies

Decision: Self-implemented authentication

Bias at play: Fear of missing future complexity led to questioning if this was "too simple"

Reality: The simple solution works

### **🔹 Case B: B2B Platform**
Requirements: Enterprise SSO, compliance reviews, security audits (SOC2)

Constraints: Customer expectations, SLA demands, onboarding friction

Decision: Integrate with Okta/SAML

Bias at play: Overconfidence that internal implementation would be "more flexible"

Reality: External identity providers are cheaper and safer.

## How to Do Emergent Design

### Iterative Evolution

Architecture grows like a tree:

- **Trunk** → Start with the main simple flow that solves the core problem. This is your foundation — straightforward, working code with minimal abstractions.
- **Branches** → Add new capabilities only when actual needs appear. Each branch represents a real requirement that emerged from usage, not speculation.
- **Pruning** → Regularly remove unnecessary complexity, dead code, and abstractions that no longer serve their purpose. Just as a tree prunes weak branches, your architecture should shed what doesn't contribute.

Each iteration adds clarity, not chaos.

**Applied to B2C Product:**
- **Trunk:** Simple username/password auth with JWT tokens
- **Branch:** After launch, users requested "Remember Me" → added refresh tokens
- **Branch:** High support tickets about forgotten passwords → added password reset flow
- **Pruning:** Removed attempted social login integration that only 2% of users tried

**Applied to B2B Platform:**
- **Trunk:** Basic Okta SAML integration for single enterprise customer
- **Branch:** Second customer needed Azure AD → added multi-provider support
- **Branch:** Compliance audit required session management → added centralized session tracking
- **Pruning:** Removed custom MFA logic after Okta's built-in MFA proved sufficient

### Decision-by-Signal

Use workflow and system signals to decide when to evolve design:

- **Increased lead time** → When features take longer to deliver, it might signal tight coupling between components. Consider decoupling modules so teams can work independently.
- **High defect rate** → When bugs cluster in certain areas, it suggests unclear module boundaries or tangled responsibilities. Refactor to create cleaner separations and clearer contracts.
- **Slow deployment** → When deployments are painful or risky, it indicates architectural complexity. Simplify by reducing dependencies, improving modularity, or breaking down monolithic components.

Kanban, metrics, logs, and feedback guide the next step.

**Applied to B2C Product:**
- **Signal:** User onboarding time increased from 30s to 2 minutes as more features were added
- **Response:** Extracted auth flow from main app bundle, implemented lazy loading
- **Signal:** 15% of login attempts failed due to rate limiting hitting too early
- **Response:** Adjusted rate limit thresholds based on actual usage patterns, not assumptions

**Applied to B2B Platform:**
- **Signal:** Customer onboarding took 3+ weeks due to manual SAML configuration
- **Response:** Built self-service SSO configuration wizard based on common patterns
- **Signal:** Security audit took 4 weeks because auth logic was scattered across 8 services
- **Response:** Centralized auth decisions in API gateway, simplified audit surface area

### Avoiding Premature Complexity

- **No gold-plating** — Don't add features or complexity beyond what's required, just to make it "perfect" or impressive. Solve today's problem with today's simplest solution.
- **No "just in case" abstractions** — Don't create generic frameworks or layers because you think you "might need them later." Wait for real patterns to emerge from actual usage before abstracting.
- **No building features for imagined customers** — Don't build capabilities for hypothetical users or future scenarios. Build for real users with real, validated needs.

**Applied to B2C Product:**
- **Avoided:** Building a multi-tenant user system "just in case" someone wants team accounts
  - **Reality:** 98% of users are individuals; started simple with single-user accounts
- **Avoided:** Creating an OAuth provider to let other apps integrate
  - **Reality:** No one asked for it; built it only when 3rd integration request came 8 months later
- **Avoided:** Complex role-based permissions system
  - **Reality:** Simple "user vs admin" covered all actual needs for first year

**Applied to B2B Platform:**
- **Avoided:** Building custom identity provider instead of using Okta
  - **Reality:** Okta handled SSO, MFA, compliance out of the box; saved 6 months of work
- **Avoided:** Supporting every possible SAML/OAuth variation upfront
  - **Reality:** Started with top 3 providers (Okta, Azure AD, Google), added others only when customers requested
- **Avoided:** Building fine-grained permission system before knowing actual org structures
  - **Reality:** First customer had flat structure; complex RBAC added later when hierarchical orgs appeared

### Known Patterns When Relevant

If the domain fits:

- **Use event sourcing** — When you need a complete audit trail, temporal queries, or the ability to replay history. Not for every CRUD app.
- **Use clean architecture** — When your business logic is complex and needs isolation from infrastructure changes. Not for simple data pipelines or thin API wrappers.
- **Use adapter patterns** — When you need to swap implementations or isolate from third-party dependencies. Not for stable, well-established integrations.

But only if the problem actually justifies it. Don't apply patterns just because they're popular or you want to learn them.

**Applied to B2C Product:**
- **Pattern NOT used:** Event sourcing for user profile changes
  - **Why:** Simple CRUD was sufficient; no regulatory need for complete history
  - **What we did:** Used standard database updates with `updated_at` timestamps
- **Pattern used:** Adapter pattern for email service
  - **Why:** Needed to switch from SendGrid to AWS SES after 6 months due to cost
  - **What we did:** Thin email interface made provider swap painless

**Applied to B2B Platform:**
- **Pattern used:** Event sourcing for authentication events
  - **Why:** SOC2 compliance required complete audit trail of who accessed what and when
  - **What we did:** Every login, permission change, and access attempt logged as immutable event
- **Pattern used:** Clean architecture for SSO integration logic
  - **Why:** Complex business rules for mapping external groups to internal roles
  - **What we did:** Isolated SSO provider specifics from core authorization logic, making new provider integration easier

### Continuous Refactoring

- **Small daily refactors prevent big rewrites** — Make incremental improvements as part of every feature or fix. Rename unclear variables, extract functions, simplify conditionals. These tiny changes compound over time, keeping the codebase healthy and preventing the need for massive, risky refactoring projects.
- **Evolution is built into the work, not postponed** — Don't create technical debt backlogs or wait for "refactoring sprints." Treat refactoring as an integral part of development. When you touch code, leave it better than you found it. Architecture evolves naturally through continuous small improvements, not through periodic overhauls.

**Applied to B2C Product:**
- **Week 1:** While adding password reset, noticed auth validation scattered everywhere → extracted to single `validateCredentials()` function
- **Week 4:** While fixing bug in token generation, consolidated 3 JWT utility files into one
- **Month 2:** While adding "Remember Me," refactored session handling to use consistent cookie strategy
- **Result:** After 6 months, auth code remained clean and easy to modify despite 15+ feature additions

**Applied to B2B Platform:**
- **Week 2:** While adding Azure AD support, noticed SAML parsing duplicated → created shared parser utility
- **Month 1:** While debugging customer issue, found provider configs hardcoded → moved to database-driven configuration
- **Month 3:** While adding group mapping, refactored SSO flow to use pipeline pattern for better testability
- **Result:** Adding new SSO provider went from 2 weeks (provider #2) to 2 days (provider #5) due to accumulated refinements

## Benefits of Emergent Design

### Better Fit to Reality

Systems become naturally aligned with actual use cases, not fantasies.

When you design based on real feedback and actual usage patterns, you build what users truly need — not what you imagined they might need. The architecture emerges from reality, making it inherently more relevant and useful.

### Lower Cost of Change

Small, reversible steps enable fast adaptation and reduce architectural lock-in.

Because emergent design favors incremental changes and reversible decisions, pivoting becomes cheap. You're never locked into massive architectural commitments that take months to undo. Change is continuous and low-risk, not a painful exception.

### Higher Team Velocity

Reduced complexity leads to fewer surprises and faster, more efficient delivery.

Simpler systems are easier to understand, modify, and extend. Teams spend less time fighting accidental complexity and more time delivering value. By avoiding premature abstractions and over-engineering, developers can move faster with confidence.

### Less Risk

Reversible decisions mitigate risks, preventing architectural failures and costly missteps.

When most decisions can be reversed or adjusted easily, you eliminate the fear of "getting it wrong." There are no catastrophic architectural failures — only feedback loops that guide you toward better solutions. Risk is distributed across many small, safe steps instead of concentrated in a few big bets.

### Sustainable Architecture

Organic growth ensures the system remains clean, adaptable, and avoids expensive rewrites.

Through continuous refactoring and iterative evolution, the codebase stays healthy over time. You never accumulate so much technical debt that a complete rewrite becomes necessary. The architecture evolves gracefully, adapting to new requirements while maintaining its structural integrity.

## Mindset & Values

### Humility

Accept that knowledge evolves.

You don't have all the answers upfront, and that's okay. Your initial assumptions will be incomplete or wrong. The best architecture today might need to change tomorrow. Embrace this uncertainty rather than fighting it. Admit when you're wrong, learn from mistakes, and recognize that evolving your understanding is a strength, not a weakness.

### Curiosity

Continuously question and explore.

Don't accept the first solution that comes to mind. Ask "why" repeatedly. Investigate how systems actually behave in production. Explore alternatives even when one option seems obvious. Stay curious about what users really need, what metrics are telling you, and what patterns are emerging. Curiosity drives learning, and learning drives better design.

### Adaptability

Be ready to change course based on new information.

When evidence contradicts your plan, adjust the plan — not the evidence. Be willing to pivot when signals indicate a different direction. Don't cling to decisions just because you made them. Flexibility isn't weakness; it's intelligence responding to reality. The best architects know when to abandon a path and try something else.

### Communication

Maintain open dialogue to align understanding.

Share your reasoning, not just your conclusions. Discuss trade-offs openly. Make your assumptions visible so others can challenge them. Create space for disagreement and debate. Emergent design requires constant feedback loops, and those loops depend on clear, honest communication across the team, with stakeholders, and with users.

## Practical Steps
**Keep Biases Visible** - 
Call out your assumptions explicitly in design docs. Write down what you know versus what you think might happen.

**Question "Known Solutions"** - 
Just because a pattern exists doesn't mean it fits your context. Challenge design inertia: "We've always done it this way" is not a reason.

**Track Decision Reversibility** - 
Label architectural decisions as reversible or irreversible. Spend more time on irreversible choices, move fast on reversible ones.

**Communicate Continuously** - 
Don't stick to old decisions just because you made them. Update your understanding as new information emerges.

## Conclusion
Emergent Design is not about doing less. It's about doing the right choise at the right time

The best architecture grows with the truth. It responds to reality rather than fighting it. It evolves through humility, simplicity, and curiosity.

> "Start simple. Stay humble. Let reality guide you."